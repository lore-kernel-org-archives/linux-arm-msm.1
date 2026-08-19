Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110263FE352
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 16:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157782; cv=pass; b=TQvDLMmQD+rmDSbNUljK1HyeLJn7qvEdP/ydc4cGzqiCqG06hsWi5u11ErkRs+SGukuTkO7IZiZVtLKmXeZHPZwQ5d5WLeZ/xV/xI2yBIV0lqXuEqZuzJJBJyE4+AdSxhc0k+92fqzibpHVjCw7miTR4Vl3xsPH8oYkvmgaYaXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157782; c=relaxed/simple;
	bh=x4BMrJH6npgExStNjLu2I3vyJCWBBAEJM/OEN4g21PM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cBOL8twtFeIPT9VWr5S1z6oTkufMuudyM6kFIdLrwKw73loU8VpQ4PWdcOWtOQQ6eCONaDAUHHmE41nia9J1NOR6IuOxacvEE2YPVR/DOsVpEvAhwCmeuTcj4CP/F2bo9XRe2rnkkLJ+vCNi+RZzoB7Kjla8UXrDiHiGGUSzgmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eErcSw4R; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eErcSw4R"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-836cd7310f4so19363987b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 09:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787157780; cv=none;
        d=google.com; s=arc-20260327;
        b=d8zB2VnyI3tSdLlZboMqOIRqcfAglJ3A0BGzEpEoY+ImviVHMMwxjcCkuA6/6e4b9y
         V8NPl83eWdYJjxqv38cPHJuDLjtux6mRXC/LVpO7/3MvEMKnSPLgtb5C22p+2Lq5dCAR
         vEBbtko7WQAtWsyG0XteuLphSwtJ4HeCtyJbrFHdLpUEX1zk5rVi6AYmp8FPe3MJohU8
         on1AGe3axdqPJbE9Jf7dRKY8JMM3gIaHopRq0tqsWid4Xp6HLV1ftM+PQWjaVl/6oglo
         02osA4XFZBzNpTvVFO2T9IdhUmnYYROcLya7FUAnFlG1mN7FfCvH9D7Y5Jp2jGDOj+tz
         Ki4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JjyqvED1vXYQCLSNxDGUqkAkwk9raHgds6DMs41QznE=;
        fh=kebk1/uBsx53NvrvIqY6wsWE/9LsWmBJ6zwKEyXVN/w=;
        b=A2w2r8w/iIRYLDbj5eW3oq0Y1rmEwMmRxaNFXXKsUsoEUqHIUNALRAUkIIWPsmgKwW
         M6mgoMWyN3h/G3hcti7zqR7bHvMLLekLGmGdQ98NID1+C321o5RRTv4BvmqkoT6h0Auc
         FRpekfz7SAjiIR15KLIZMYarwxaGly7LsaJc1eNUa7q3InMN0GvsB1dvA+6z4kh0FvYH
         vjd0zFmftKNntZMRZgHB16LKd42WQb6Pgx7ZuEg8aFjeEoQE3TW123ahvo5o78q1rfSc
         sCnFPu0ZC5G64HIqK9cRsQ3yPZSSF03352WkwRuPt7o7C6Wz1smSO4WOyEEksFI43Ubh
         7p3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787157780; x=1787762580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JjyqvED1vXYQCLSNxDGUqkAkwk9raHgds6DMs41QznE=;
        b=eErcSw4RsFh1uxNTq5po7Dox1foYGCLZsZBFEgTI3Hd90fHEn/+3tj1+EohY1B5f9o
         lKyfKhkc+WjrEu91+fXo/ZRgGZqiF2PiaK/wSfkQD7sYsnobNIbhoBHhuVemrHJAUJIa
         mjzkoVYYAg1v1EA9vwHJK7lR2/VugDShnYORSaTH0OJRtfq7IKw2UzzSaR3y37FYnQjM
         iCMH6ZF9NplMgaCwSsGjcedCZRXtoWMOOb8ZTqGq3CHlr1CkqSKN9XHpezJgXiKwwqWJ
         N6nvefY688SYVzFTl7oYjseXbq9z5EWhAtyOkSaPcQPhJrXHLvwl2b8ilYC7MZvooobU
         O7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787157780; x=1787762580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JjyqvED1vXYQCLSNxDGUqkAkwk9raHgds6DMs41QznE=;
        b=TF7UacFId8mje/xUxnFisYvr6rqD2S3A+IPkcHcmEVNDpZ26EQuTYFrcOMswcDEvw2
         HaZk7RReoOmYySRa4XPKLui0TMCX3K4q9CdtHqjbxSAc0J9rKp7owPr/W19uZIjG4igP
         AMHV1wa1dDSknR8LZGBxxDSZ89p1wEXi82xd7QP/rVwExa1W8fP8eQNlG6LEzzmPTSf4
         P9l6WoU+CCthsS3usgdgphoMmBPfk3tBRUZq5LSPn+dkxjHx6uCPHBA03RJrly6z4gc5
         pkZO06teeKW9SO70yFFY6vcYODIXdw+2Wnrmw83aJYjQnKptE3XpfwRgnzczHgeBlhmg
         z5hA==
X-Forwarded-Encrypted: i=1; AHgh+Rqp+z100pXu2hcbEcDYa28tstkEoCYwWFBWBBQc5kyNYg3PQqq+iDCah3H7rF/C9C1xUjEp+skYanLSoHQM@vger.kernel.org
X-Gm-Message-State: AFuF++krhjeBf0ArJpVy75yruivVzaS8x0uLpt2Kg/r+pZ4UQSHoC1GE
	oFri+zn8/Gg16rNl/hQ1WX/HBbRGJg1HwfJipGID3ouedlDb2TD5YatWuylhOeg2n93xGM88WlG
	9ldug1Z40tfOXBfphmcMVqKswBeSB/a0=
X-Gm-Gg: AR+sD10cn2mhXRyQ1vR3QXoE0g8FETD/45Jyv2nDz1r8m4qZ25JJNOTIMOvhprmIGP9
	lb8X12WKeYZ+UOGMiplL4VXWLB9PkGc2f7fs1buoqp48R9oNU9ZresEaqpCQshvZbCObFLHY/Zi
	eLxSJq6wHVZCVMrZXa5l0IcYYNIWpwZ5XZ/Oh7K94ORFaT0cdU6didBN7B8IuPO+RmADNT/pG3C
	pnxn+GtVn0+kOcs//JRGycS3IUFjwMWae1DEl4a0VjS6Qpva9h7Kg0NGDTVQ6+ZyM4lR1yQYyG5
	u1nk9RBaVhmWwIs0kuvptBXhK6IgyX3nAmojUsOa4N4OAJytzOfCIdF6fpe424DCKaQNuVf1dQH
	vfv3uxCw2ecEdSELF5Ny4kyb35wE+
X-Received: by 2002:a05:690c:67c8:b0:833:801:f715 with SMTP id
 00721157ae682-844e2ed7344mr26014567b3.18.1787157779913; Wed, 19 Aug 2026
 09:42:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817205017.56524-1-johannes.goede@oss.qualcomm.com>
 <20260817205017.56524-2-johannes.goede@oss.qualcomm.com> <CABBYNZ+Bhhx3rtq8i_FGu2a_oFyWquo_gTRcmPyM6HcFC3pkVg@mail.gmail.com>
 <73afb7ba-53c8-423e-81a2-7e923896c995@oss.qualcomm.com>
In-Reply-To: <73afb7ba-53c8-423e-81a2-7e923896c995@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 19 Aug 2026 12:42:48 -0400
X-Gm-Features: AcwNN1XKAYfm5UlUyXAoNQwevzrnZfVpjrovOSRjuG65-p4txe9DDVnsWZ5J-Ow
Message-ID: <CABBYNZJrTSPya+-vwLTpC8iMYj_bygRwZm-Nzk_Fv-WH+FRo-A@mail.gmail.com>
Subject: Re: [PATCH 2/2] Bluetooth: hci_core: Handle skb_clone() failure in hci_send_cmd_sync()
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Wed, Aug 19, 2026 at 8:38=E2=80=AFAM Hans de Goede
<johannes.goede@oss.qualcomm.com> wrote:
>
> Hi Luiz,
>
> On 18-Aug-26 20:01, Luiz Augusto von Dentz wrote:
> > Hi Hans, Ibrahim,
> >
> > On Mon, Aug 17, 2026 at 4:50=E2=80=AFPM Hans de Goede
> > <johannes.goede@oss.qualcomm.com> wrote:
> >>
> >> From: Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>
> >>
> >> hci_send_cmd_sync() does not handle the second skb_clone() failure as =
it
> >> does the first one. At that point the command has already been sent an=
d
> >> HCI_CMD_PENDING is set, so an allocation failure leaves the flag set w=
ith
> >> req_skb NULL. The response then matches nothing and the caller blocks =
for
> >> HCI_INIT_TIMEOUT before getting -ETIMEDOUT, reporting a memory shortag=
e as
> >> a controller timeout.
> >>
> >> Clear the flag, cancel the pending request with -ENOMEM so the caller =
fails
> >> immediately instead of waiting out the timeout, and return -ENOMEM so
> >> hci_cmd_work() does not arm cmd_timer for a request that no longer exi=
sts.
> >>
> >> Clearing HCI_CMD_PENDING here is safe: all code touching that flag run=
s
> >> from hdev->workqueue, which is an ordered workqueue, so those paths ar=
e
> >> serialised and cannot race. The one exception is the cleanup added by
> >> commit ed516e3f1aa6 ("Bluetooth: hci_sync: Clear HCI_CMD_PENDING when
> >> dropping the last request"), which runs on hci_dev_open_sync() failure=
 and
> >> from hci_dev_close_sync(), and the workqueue is stopped before that ru=
ns.
> >>
> >> Fixes: 2615fd9a7c25 ("Bluetooth: hci_sync: Fix overwriting request cal=
lback")
> >> Signed-off-by: Ibrahim Abdelkader <iabdelka@qti.qualcomm.com>
> >> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> >> ---
> >>  net/bluetooth/hci_core.c | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> >> index 8aeb3024428b..9585b42e7970 100644
> >> --- a/net/bluetooth/hci_core.c
> >> +++ b/net/bluetooth/hci_core.c
> >> @@ -4092,6 +4092,11 @@ static int hci_send_cmd_sync(struct hci_dev *hd=
ev, struct sk_buff *skb)
> >>             !hci_dev_test_and_set_flag(hdev, HCI_CMD_PENDING)) {
> >>                 kfree_skb(hdev->req_skb);
> >>                 hdev->req_skb =3D skb_clone(hdev->sent_cmd, GFP_KERNEL=
);
> >> +               if (!hdev->req_skb) {
> >> +                       hci_dev_clear_flag(hdev, HCI_CMD_PENDING);
> >> +                       hci_cmd_sync_cancel_sync(hdev, ENOMEM);
> >> +                       err =3D -ENOMEM;
> >> +               }
> >
> > Sashiko flagged a problem with this change:
> >
> > https://sashiko.dev/#/patchset/20260817205017.56524-1-johannes.goede%40=
oss.qualcomm.com
> >
> > Im with the opinion that this shouldn't cancel the request, because at
> > this point it may already been sent to the hardware so maybe we should
> > flag it somehow that req_skb wasn't able to be allocated, or something
> > like that, but the command is still outstanding.
>
> Ok, so maybe we should move the hdev->req_skb =3D skb_clone(hdev->sent_cm=
d, ...);
> to above hci_send_frame() ?  I don't really see a reason why that cannot
> be done first.
>
> And then the hdev->req_skb =3D skb_clone(hdev->sent_cmd, ...) and
> hci_send_frame() error handling could share a common err path both
> calling hci_cmd_sync_cancel_sync() ?

Looks like we found a much better alternative which is to use skb_get
rather then skb_clone for req_skb:

https://patchwork.kernel.org/project/bluetooth/patch/20260819135321.1444185=
-1-xin.chen2@oss.qualcomm.com/

>
> Also while looking at this I noticed that hci_send_cmd_sync() exits with
> ENODATA when hci_skb_opcode(skb) =3D=3D HCI_OP_NOP, but at this point it
> has already set hdev->sent_cmd and will also still set hdev->req_skb
> if the conditions for that are met.

I don't recall why exactly it was needed but Im afraid hdev->send_cmd
needs to match NOP, we do use HCI_OP_NOP to wait on an event without
sending a request.

> I wonder if this is the right thing to do, or if the hci_skb_opcode(skb) =
=3D=3D
> HCI_OP_NOP check should be moved higher up in the function followed by
> an immediate kfree_skb(skb) + return -ENODATA ?
>
> Regards,
>
> Hans
>


--=20
Luiz Augusto von Dentz
