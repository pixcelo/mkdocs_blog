---
tags:
  - �u���O
  - �N���[���A�[�L�e�N�`��
---

# �N���[���A�[�L�e�N�`���ɂ���

�N���[���A�[�L�e�N�`���ɂ��Ē��ׂ����Ƃ��܂Ƃ߂�ꏊ

## �݌v�ƃA�[�L�e�N�`��

�\�t�g�E�F�A�A�[�L�e�N�`���̖ړI�́A<br />
�u���߂���V�X�e�����\�z�E�ێ炷�邽�߂ɕK�v�Ȑl�ނ��ŏ����ɗ}���邱�Ɓv�ł���

�� �݌v���D��Ă���΁A�����[�X�ɕK�v�ȘJ�͂����Ȃ��čς�

�N���[���ȃR�[�h�łȂ���΁A���Y���͋}���ɒቺ���Ă���

�� ���󂵂��R�[�h�������ق����N���[���ȃR�[�h������������ɒx��

�����i�ޗB��̕��@�́A���܂��i�ނ��Ƃł���

## 2�̉��l�̂��b

�J���҂́A�ȉ���2�̉��l��񋟂���
- �U�镑��
- �\��

�u�U�镑�������A�\���̕����d�v�ł���v

�\�t�g�E�F�A�̍\��
- �\�t�g�E�F�A�́A�ȒP�ɕύX�ł��Ȃ���΂����Ȃ�
- �ύX�̓�Փx�́A�ύX�̃X�R�[�v�ɔ�Ⴕ�Ȃ���΂����Ȃ�

�r�W�l�X�}�l�[�W���[�̓A�[�L�e�N�`���̏d�v����]���ł��Ȃ��̂ŁA�A�[�L�e�N�g�A�J���`�[���������K�v������

## �p���_�C���̊T�v

3�̃p���_�C��
- �\�����v���O���~���O : ���ړI�Ȑ���̈ڍs�ɋK�����ۂ�����
- �I�u�W�F�N�g�w���v���O���~���O : �֐ߓI�Ȑ���̈ڍs�ɋK�����ۂ�����
- �֐��^�v���O���~���O : ����ɋK�����ۂ�����

�K���Ƃ́H

���u�������ׂ��łȂ����v���l���邱�Ƃ��d�v

�A�[�L�e�N�`����3�̑傫�Ȋ֐S��
- �R���|�[�l���g�̕���
- �f�[�^�Ǘ�
- �@�\

## �\�����v���O���~���O

�ugoto���͗L�Q�ł���v

�\�����v���O���~���O�́A���W���[�����@�\�I�ɕ����ł���

�傫�Ȗ��́A�����Ȗ��ɕ����ł��� �� �u���������@�v

�� �傫�Ȗ������W���[����R���|�[�l���g�ɕ������A����ɏؖ��\�ȋ@�\�ւƕ������Ă�����

�u�e�X�g�̓o�O�����݂��Ȃ����Ƃł͂Ȃ��A�o�O�����݂��邱�Ƃ��������̂ł���v

�� �e�X�g�̓v���O�������������Ȃ����Ƃ͏ؖ��ł��邪�A�v���O���������������Ƃ͏ؖ��ł��Ȃ�

�A�[�L�e�N�`�����x���ɂ����āA**�@�\����**���x�X�g�v���N�e�B�X�ł���A<br />
�ؖ��\�ȏ����ȋ@�\���������Ȃ����Ƃ��ؖ��ł��Ȃ��ꍇ�A���̋@�\�͏\���ɐ������Ƃ݂Ȃ���

## �I�u�W�F�N�g�w���v���O���~���O

�D�ꂽ�A�[�L�e�N�`���̊�{�ƂȂ�̂́u�I�u�W�F�N�g�w���݌v�v

�|�����[�t�B�Y�����g�p���邱�ƂŁA�V�X�e���ɂ��邷�ׂẴ\�[�X�R�[�h�̈ˑ��֌W���ΓI�ɐ��䂷��\��

### �|�����[�t�B�Y���̃����b�g

�v���O�C���A�[�L�e�N�`���������ł���<br />
�� �Ăяo�����́A�Ăяo����̏ڍׂ�m��Ȃ��Ă��g�p���邱�Ƃ��ł���

### �ˑ��֌W�t�]

NG�F�����x���̃��W���[�� `OrderService` ������A���ꂪ�჌�x���̃��W���[�� `EmailSender` �Ɉˑ�
```mermaid
classDiagram
    OrderService --> EmailSender
    class OrderService{
        +EmailSender emailSender
        +ProcessOrder(order: string)
    }
    class EmailSender{
        +SendEmail(message: string)
    }
```
<br />

OK�F`OrderService` �� `IEmailSender` �C���^�[�t�F�[�X�Ɉˑ�����悤�ɕύX <br />
����̗���ƈˑ��֌W���t�]����A�u�ˑ��֌W�t�]�̌����v���K�p�ł��Ă�����
```mermaid
classDiagram
    OrderService --> IEmailSender
    EmailSender ..> IEmailSender
    class OrderService{
        +IEmailSender emailSender
        +ProcessOrder(order: string)
    }
    class IEmailSender{
        +SendEmail(message: string)
    }
    class EmailSender{
        +SendEmail(message: string)
    }
```
<br />
<br />

�\�t�g�E�F�A�A�[�L�e�N�g�́A�r�W�l�X���W�b�N����ʂ�DB�Ɉˑ����Ȃ��悤�Ƀ|�����[�t�B�Y�����g���Ĉˑ��֌W���R���g���[���ł���
```mermaid
graph TD
    UI --> BusinessLogic
    Database --> BusinessLogic
    BusinessLogic -.-> UI
    BusinessLogic -.-> Database
```
�r�W�l�X���W�b�N������Ɨ������f�v���C���邱�Ƃ��\�ƂȂ�i��ʁA�f�[�^�x�[�X�̕ύX�ɉe�����󂯂Ȃ��j
<br />

�|�����[�t�B�Y�����I�u�W�F�N�g�w���v���O���~���O�̗v<br />
�� ��ʃ��x���̕��j���܂񂾃��W���[�����A���ʃ��x���̏ڍׂ��܂񂾃��W���[������Ɨ������邱�Ƃ��ł���

## Reference
- [The Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [�����N���[���A�[�L�e�N�`��](https://qiita.com/nrslib/items/a5f902c4defc83bd46b8)