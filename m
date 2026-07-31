Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D2443CE54
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785511549; cv=pass; b=nfuizeiHmY1dOsY3SM3j+kYFl9nJAAFaqNr8BoQjd2fsZ1WklqGtOrNj0YRxUQ9HFgYc/MSzGZBgGFnVqeNSOD5uhUd51UPXFH2evHAnmniYkb2vQuVH/QkQoLL4tVZxPaPx3jYKb0KNu5lXjZLd64dgFCNTD/H+f9jDn3mAmcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785511549; c=relaxed/simple;
	bh=r3BGYhuAYAfTixk0FCpnDsR6p4q7mVxOkENcHc5JNeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUNh7XDujMgUYtGmimr/ryBtEDi8xccv13TaZwxidWp7heZbnFMAeAGkU7gh0ODMTOLIU3pvtmH9ajWGh+G5kdEiRoMy38s/TRC6+/inJ///ZA5aB3fiGfscH/LSWLKyCwvV+cMYopFPi7EhIb2//MfSxIb9eM8U5xsa3BQ9cIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNGd0gLt; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNGd0gLt"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6685483aad2so1564963d50.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:25:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785511543; cv=none;
        d=google.com; s=arc-20260327;
        b=qNIv3gw0cKk89acr7OttKCYLHFNMKsHGu2uMBqQ6QHxy0rn3rZtRc3iIAagG7v8JRY
         yf02hUDm3kwiOooDbcyZAiXhd0Cxt36EHhrD7x+RTtKVGwlDhLGeVHm3OIOGrCugEXkk
         XHKAAUjEcK4m4VrXQHqgtguAQRRLAO6VyuYI8pbzdYFWDZ1wSo7x/a+IZI/xeZu0XhWN
         O+akHwPwNdNOoBUaQXap16nFCG+ORtCBqFkEmxyyA1Asj2Vti7R+6RqiqiAe9JaX49Bh
         N1UaQ1WAK8ofX5xu/7doE71LxiMRDCNT0p/kIfoTUB9eSudfvsxS5MNrKZjtGJlHuY5w
         NFhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aeXGsNobYcCbssuhzV+aneWfZNBxdavhRmXzGbjYdbc=;
        fh=+b4xqD6oncahnLKyM9O0Zp7skDMUbiQTBn9QMC/rMBI=;
        b=eXsgg6X2Etvkt2Ol8t5SCxcqWamGtvKmOVH7wmj3mD+4tqkTueFrE0OhYAf9xzSpy2
         hBZcHk6ed/uG/F7mIAlk+4nb7TCL1a4A3Mg85W68IKR0N1kqAPd6+8zbiX+UXt58GCJZ
         cAanXxonHHv2XElYNNmXyl20djcFu+g2vzjsWcPzIWqgEFdCgn1PSgXJYH6UrBhLTY/a
         6dFivfvglXyBzpmeUmup6jDe/ZZC8GtedVUzmW/IBOInbm/kaQYTQlGNL0xfDf/ndW5i
         m94YMxOtAC66O+9kfsuZpIRdUZlmpfXYMSevK+25I16SYGhYLJPHI1HY8Pf7ZX88Mmth
         Cy3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785511543; x=1786116343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aeXGsNobYcCbssuhzV+aneWfZNBxdavhRmXzGbjYdbc=;
        b=QNGd0gLt5biSDdt1mfZ49OhAm/vuE7vZkny3azIe/YhS2XVcUEk99eXICqqcGyG3Cn
         XE+/ofg3kcImvIoWvD3M0laJPybFyAAZ/G9PfoArywh7syCfPixUPk6HfSv9dozElakt
         ztyYjK1rV874UtR21l4EwIo5Zqtq0vHZeQmGfsyNzMOoTdMAJB1ESaT8/6Y11Dz3j6Ev
         VpudTKc6iTd8O680r0bg2CVfpI1LjPFeJk5WaGOJ6lPECWyPFBmqyWOHi0uXvKfe5khV
         0T7zw1tmTNN3hQN/4gVUkXmCI/RWgxiohd9UepHsoTjco32yOS7z3LA8ba9Z79OH4d3s
         Ctow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785511543; x=1786116343;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aeXGsNobYcCbssuhzV+aneWfZNBxdavhRmXzGbjYdbc=;
        b=I66bTRH5gi1d5YEaxkOa1Lu/0VdQa8k14kySHsgb0VjZb20dHi6Lpza4hxY+ncdgpk
         BFlxWZWtqcQonl6EkJd+dUvWxRZH8WMDfNLJwYDmKjS1PnsMDcmX23RkUE33en4FKhcS
         H5+tuxFB3j4sk8J+c0nXd4VXg1fqGGHfIDNAjCnZbG4zIErJ9DL1o4CFdUlVr89sSD4Q
         jiLkEdbixLaKy37FQnwMiyVNnfU54+1tEQUCjgTB2EWiIuEFjoTJdSWVjEPv/LMRJxKp
         kxoGM01lti1kWjr+fl8MOLXq/gMTXOuKSZDB72O6ZO+dGEkDEssuq/kz1NXJ7z/tSnW4
         oX5A==
X-Forwarded-Encrypted: i=1; AHgh+Rrl03Z94MBGa9bnKJje/jip9/Kvpw6YdP6qVFFnlRSkRmHLINWBafEiaxagSN+YELaqQJPRBDvXGZc+yU5X@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0g07f86+wWU54GRSh3E9kQvjW9jCZ1Fm8ay6sL7OLleCWeM8V
	2B+rCRZRSle4L7E1SBB6oVpiCYbDtJ7I8WK48fIimBaaqxiyXRwexg/X1pA6qfud3v9/JqgIaQN
	bJkYsxRG57vzAfw+EhHUPFjeRn7ktZ3g=
X-Gm-Gg: AR+sD11rou+qFbYmY8ZOmQMfy3YZ668Iip1hgdryK/ks3ydKyEmtBCpA+Qn+2v9FiYC
	Ao9Y3G6IUodNQQkMNVsz2so7amplNykwDsX3q5AIRiya0QoxtAbV1CxWks6S1/Zqw9ZNZH/O3ja
	sSvDa74w0VAV2QbI/Wonm4FD4PZpJj33ZbgtkowKjVRzxTTktA+kw0abCkB/is3a+MT/vGbMQ3q
	BbkSEGIH7Nxx0kOGcx0S9E1kkuo93P+6v32vO/ohuJG7khKu+p19GhpJ5/HO1hJqIEmS97ZDw2h
	D+hM/KlY4e7ZUekpqeJhQVW86H5kskthtMSwC+fyjXt/a2mgWz3xnfLua8nfn6PJdL3Cbw4AY+L
	nzuhuGyPWdbFYgtfw51bL8TBP5NCWJuNiP10=
X-Received: by 2002:a05:690e:23db:b0:668:434d:a2f5 with SMTP id
 956f58d0204a3-6694efe1128mr419973d50.1.1785511543228; Fri, 31 Jul 2026
 08:25:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731042920.2431343-1-shuai.zhang@oss.qualcomm.com>
In-Reply-To: <20260731042920.2431343-1-shuai.zhang@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 31 Jul 2026 11:25:31 -0400
X-Gm-Features: AUfX_mxNSOCDAeGLeIjPAMPEEY6vriJ4fIIQAzX8I6gPSwfUMPUdB1nzVJokPr8
Message-ID: <CABBYNZJuenvKSvHuf6DCkt9hpdhuECm3gf5hiV+FyS2E9AM7nQ@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: mgmt: always reply when a queued mgmt
 command is cancelled
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	chejiang@qti.qualcomm.com, quic_chezhou@quicinc.com, 
	wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com, 
	mengshi.wu@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuai,

On Fri, Jul 31, 2026 at 12:29=E2=80=AFAM Shuai Zhang
<shuai.zhang@oss.qualcomm.com> wrote:
>
> On boot, the kernel's HCI_AUTO_OFF timer powers a newly probed
> controller back off after 2 seconds if nothing has taken ownership of
> it yet. bluetooth.service is expected to take ownership within that
> window by powering the adapter on, but on slower boots bluetoothd can
> start late enough that the two race: HCI_AUTO_OFF fires and the
> controller is torn down and re-initialised while bluetoothd is still
> in the middle of its own adapter setup sequence.
>
> When that teardown happens, any mgmt command bluetoothd had already
> queued for that adapter is cancelled - but userspace is never told.
> bluez's mgmt command queue is strictly serialised, so a command that
> never receives a reply blocks every command queued after it on that
> adapter indefinitely. In practice this means bluetoothd gets stuck
> before it can register the adapter, and reports no controller being
> available at all, even though the controller itself is healthy and
> fully usable moments later.
>
> Fix this by treating a cancelled command like any other failure
> instead of silently dropping it: always send a reply back to
> userspace, using the existing "cancelled" status value. This mirrors
> how other mgmt commands already behave when they fail for other
> reasons, and lets bluetoothd's normal error handling take over
> (log the failure and continue) instead of hanging forever.
>
> Verified on a QCS6490 rb3gen2 board where this HCI_AUTO_OFF vs.
> bluetooth.service race was reproduced: before this change, hitting
> the race left the adapter permanently unavailable to bluetoothd until
> the service was restarted; after this change, hitting the same race
> no longer affects adapter registration and the controller comes up
> normally.
>
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> ---
>  net/bluetooth/mgmt.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> index 167d75e34..9031b5d5d 100644
> --- a/net/bluetooth/mgmt.c
> +++ b/net/bluetooth/mgmt.c
> @@ -301,6 +301,8 @@ static u8 mgmt_errno_status(int err)
>                 return MGMT_STATUS_ALREADY_CONNECTED;
>         case -ENOTCONN:
>                 return MGMT_STATUS_DISCONNECTED;
> +       case -ECANCELED:
> +               return MGMT_STATUS_CANCELLED;
>         }
>
>         return MGMT_STATUS_FAILED;
> @@ -1338,7 +1340,7 @@ static void mgmt_set_powered_complete(struct hci_de=
v *hdev, void *data, int err)
>         struct mgmt_mode *cp;
>
>         /* Make sure cmd still outstanding. */
> -       if (err =3D=3D -ECANCELED || !mgmt_pending_valid(hdev, cmd))
> +       if (!mgmt_pending_valid(hdev, cmd))
>                 return;

On set_powered_sync:

    mutex_lock(&hdev->mgmt_pending_lock);

    /* Make sure cmd still outstanding. */
    if (!__mgmt_pending_listed(hdev, cmd)) {
        mutex_unlock(&hdev->mgmt_pending_lock);
        return -ECANCELED;
    }

Which is why we consider -ECANCELED as a NOP, also if you dig deeper
you will see that hci_power_off -> hci_dev_do_close ->
hci_dev_close_sync -> if (!auto_off) __mgmt_power_off ->
mgmt_pending_foreach(0, hdev, true, cmd_complete_rsp, &match);

So the reason this is not working as intended is because we are not
clearing HCI_AUTO_OFF once we receive Set Powered command only once we
run hci_power_on_sync which create a race where the likes of
bluetoothd will be trying to power the adapter but power_off work is
still pending, so we should probably clear HCI_AUTO_OFF whenever
setting HCI_MGMT as at that point we know there is a user already
there is no point in powering it off.

>         cp =3D cmd->param;
> @@ -5651,9 +5653,6 @@ static void mgmt_remove_adv_monitor_complete(struct=
 hci_dev *hdev,
>         struct mgmt_pending_cmd *cmd =3D data;
>         struct mgmt_cp_remove_adv_monitor *cp;
>
> -       if (status =3D=3D -ECANCELED)
> -               return;
> -
>         hci_dev_lock(hdev);
>
>         cp =3D cmd->param;
> --
> 2.34.1
>


--=20
Luiz Augusto von Dentz
