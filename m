Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793013949;
	b=eV4ls4UDbJpQ1npdQUpdpTeliDJ1iyzZ9kADKzH1erh/HukRBRrzeuv4gOQ9Csv73Vd/
	 rKROffUKguqMmyA6EvmS02TEjpV7sZhP+d3XvpJsxMBKThvjuUt+Gu9IYzjosE52FG86E
	 XrJy+0TyvqZtIeahmAQuHS21DlwjCrlRCGIpi2+8O/Qpily0syC+IUqNiIjHBc6MhYBMf
	 AyXN1cw+8vH0bjZU2o3M6Pev2guqKk3JsSfu+s+ItNP034hIUcZh/rkmrre4yjthq9O2P
	 bZ/+LOVYhaInvKgVX1QuM4QkaHFTBavE3FxrjxRf1Kad9+US5tC/dtc+IkyQKqzw7Jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=;
	b=DQ9OBNdpsfvJZSIUYeKljz0sha5Y6wLJKiPb5ruthj6117Xm1MG8lCTHuOZCM5pJOS3Y
	 aVxPxjEJF5yg7EadepwbEPbn683I41epZcQ+/vAGUFStVtmiXQhLkDISySbSvEHSOyoMo
	 k8EyeDog4sQAXXtcPBjBSugAH/zxI0Qd9wLZu2tYVJp8fwgBLRhRg57ThRFGZ8OD4lLFm
	 DqiE/0M6VNLOR+24hOnJuZZgFxQ0r1cs9UygUvKSVFCOc2TlAnGrvUWQQgR9E2u7YpKH1
	 3c0SXvO4l54G4fbt1eH3e2K3d7k514W8N19ykTmx1oydiXtatrA7uOtTF8aW+lXh84g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dnEBl84P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AOUsYe6B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365B9606A323
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 365B9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dnEBl84P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AOUsYe6B
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsuwU2732735
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=; b=dnEBl84PS75rsH+m
	t8WJ81u2wB65Nq2f6dOZLiSzrRzUKj9Pyzz3f2MND7GXZofF94QSfPq6MViMHQBq
	bSksoKo1Y38NbJHZz1v6vnCKdVCH70IYmaV0Umc8+BS+KcjIdEcJfBQ+4MEMozog
	o+2Ym5XwBrdsZDjk/RqWosjsWX5+LEAvltQ8WhhU5dARfQE23oIebl5uYuWOWQTA
	em6gk0bD2HUH9s1AEODOEAXwpQeH600P0hHKdXLJEuXnKFdhGr3hHruBA9KPExlr
	TdUGU4BwIYnoJZYFsYqTPOXVafySOKY3NF+LOeofxcYziPiLyE4e4WNY0W/SMTdy
	RXQfVg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp8d5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:25:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ca9b53afaso454481085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 04:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793013946; cv=none;
        d=google.com; s=arc-20260327;
        b=JiiER42Z9Ikzj8Ph7EnaQ+2UqG7JvsIrzpvNNsulXiTRyWR3prQVnFWJMJ22jRHI27
         mt/ipqdpqa3bQkPJ+soze6pmwIE/UHYPFlU+HqbdJS1UfghV//9bFTsskhsLI+nN8D7I
         4yi0GffknJEDNJONvwVvLublx9wxrUKPWypgA7CzrPDABVC3PighKW+n46fdAd4WVU7z
         1csH66HChTyaXFLH4sD93KxvpuFFaJAwldysyWfG0oBZob3X97pY7R8oWUM2yTrVrT6W
         5LSD2bOR3OD8xyNHTC5mHkP+E9+AXV9Zb6Lr8GSo2PeWNgCntRthx7pE2+WROHcngBjF
         4mkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=;
        fh=/H5OltxJ+fPeMSqIiXPaRjvILCwocvuGGRuKTsnQh0Q=;
        b=JN9vijQkeJVCF35QmmVqzC2dqkIcnWzquUIyIN75FnW4A+8JnLeBzoc0URg04+HP69
         yHe72Y9zK+9xATfx46PeYNzQSmPnhk/ARKc4UNqhk/XdkyHZ2USKQOP4xYtAGCacl+Cl
         XnF5Pp2YWFtp6qKOkBcHND6991//D05kTf45TL5x7LHfXZBqaaJqouNSwSQJ1yYYyFUU
         Up9+92+ByOUsovX3Y9r4VhvcRmLKwZpQOnskNQosETBY75uleXMHpetWUC3nP68caiMN
         e/q5QpxmLup/LiXt+EMMoCpKQ7s+ETAhZC3LecnQpygGXJjrVV7LNDqGahjnP2Qxn0/U
         pDvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013946; x=1793618746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=;
        b=AOUsYe6B+tr9jcb3Y3bSQ5SEIWG76vCozA59tpwZxg092fJzIqAxkcCUSVlDqSYdCO
         3Le7sTlWyrekQILLlyBHm293aJJPUOsYXa5GN68/u3NMlHiz72LGybgN0HCXolEyTGyc
         p7d4AoArT92bflVqszORm8S9ZRun6tLHK6068JH77owtZRnU+/OnIbXv5Ffcb+3EOepp
         p8lwoK5E5XDSzbFqwIMP2S1IRRCwfO9TRCXW/CN354BYSeFB5Gjqo2CLgCoVEnl0TOMw
         1CoibTH/0+emlPhAqjdlgPH5TDlAuAx8am3rdm+OhbUjDQFSpYM+6VzfuNJj3VxUhuy9
         cJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013946; x=1793618746;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpZyhfaDwEx58Hf8F98PivHYwKz/1TShh9vNrajkRso=;
        b=J0dM/YMbPe11n2oUN2RDzUShEhmm5yosYarMW9JYo8/K36MrS5Um9kRqVxDVnAC+qo
         UxQCfouHiINj8Qxzr2SNLCS/C8J/sHnOTj3bjPvqldA4gmpAHekbJ93Y7CYRFheWCzcJ
         H/zNdpf2uSnsEQ0VGTkpMh8jYkITz4cp6r2Jcerr6G62MfD+57QTF+B+iTC2fo616J4s
         2XmoeTfDVdJ3VjJWpSWJ3jd794CdIBOQdIWB4Yc+7YRrCvAlroUKTll4Cli/f4nqsr++
         00KFd+HSCnz7kyv30z9M1wagJzZHTjhnnA+6ll6X0x945wLBsqTXPC0bz4s/1chqmwZf
         z0rw==
X-Forwarded-Encrypted: i=1; AKwUvByg5meEILNzmqVnjlvQjO7ekHb40afZhMIyNuxcLqKyG9yl4P3VKMEAb94l7xnazhLUVe6QqC9rh3G8rrdp@vger.kernel.org
X-Gm-Message-State: AFq9FYIk4aonlsDuHT+3A37JocYxc+BCyGeB12wQ4xYqEhqU/EcNvmrd
	vqI3z9hvEJRwtbQrQbI5b5pXhvTEzfKaD73AUx++2HV5YPEnAoXgpiHMwQto48eWtJ2o0pU1mVf
	0e/QzWtOicqcgSfRAx0UfgseyTcKVKSwkrBMKaV4sXoq+xpD4+z8uTvuqf1fjjJqlcoNJLW5Rg1
	NFSD0KwF5T7x9ub7lvv2kDyXnvWPx4Dj8YpBUbmczWSfA=
X-Gm-Gg: AYBFou2Jns7bFRMy6qvHMZS5HmHQqK2VNpfbfPMfUwXuBamy8zDodj5z8u6XoUGRshg
	PzdUKQKslJXlE3aVvuVYG8iIqwqWaHP/t3bMbJj8cSDVM3T+u9LvYNL5PIhXhlysidAJ/RGeRKh
	Iwv1Md+1IdapRPE561ZW9C3WSWVMKS/gUv8Ya3ByoRS0+MZ3ha2OIa45yJAkQsHmIkr6hejHc7X
	nGYks/yqOCyCk7ABt14cXNEg61vrdKjylEgbt0bgr0KyVUZtl/MSwzn2znJBWI7V9C9SZby4CL8
X-Received: by 2002:a05:620a:178b:b0:93f:26d6:d70b with SMTP id af79cd13be357-940ef8af1a0mr924705485a.29.1793013946384;
        Mon, 26 Oct 2026 04:25:46 -0700 (PDT)
X-Received: by 2002:a05:620a:178b:b0:93f:26d6:d70b with SMTP id
 af79cd13be357-940ef8af1a0mr924701085a.29.1793013945915; Mon, 26 Oct 2026
 04:25:45 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com> <20261014-b4-nvmem-efivar-v1-3-187c85f65018@oss.qualcomm.com>
In-Reply-To: <20261014-b4-nvmem-efivar-v1-3-187c85f65018@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:25:34 +0100
X-Gm-Features: AclHuK_V9TSwenazx_QbQTVJlNkn-z_z7PltZHh3vUhKfg_kBmr_W8aabFtQzwU
Message-ID: <CAFEp6-2akDevVekLozzaH1e7rNuqqfpHjQiQvSkwuv_4zLucjw@mail.gmail.com>
Subject: Re: [PATCH RFC 3/5] Bluetooth: hci_qca: Support BD address from an
 nvmem cell
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX1f+aeCwWLhqs
 kdH0XSsO90xNSGyAr/3tZxzsdqyPITuhc/zs8+0pdqkBwyx2D5a+q+GI1MmLKXPlPKZbgMYgIAp
 GEAHgr/U9e5cV8fF89zagKxqdZUpcVU9kO1igtK5iS4Kt/92jvHGNcRiHYcayx2OTzGi1m83qJP
 s3Tk4VLtWPx6zaWouMWomSy0f2BLdhvBrO0tR0eC+CGIq7yEHuZaDwBeT7XbxtbBXn5OVpwqCXn
 E938/i/mXqWGYV5HE62oSK37nC8RKeaw182GkRH9xGLeF9dQ9NLXThNEMKoOv6TOJSNVLGzjPGP
 vvqZZK/J59VjMJJG4ualMmL6YhlfQl3qVUyDAeqQ1xGJAWZSVpViBQADUs8MHaUlJoiLiQWEran
 nAbksijOZUACwHMkP4XcN2xzNSzh5KmOto1IyNKhRJA/WyfGWg7E8toiC4/hC7yGygd+ptbspWN
 AksSPWyhn7KEpDR6UNw==
X-Proofpoint-GUID: PKKDXOFuTJDisl3yKJFczRekpZlktnvb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXyLfNbt68x2Nd
 26r2rMfLqybb2oaDzhtrlXSZT/Y6S5sjgP44aYbotEuLYKwkw8gtA46JRSE++vrqNuLl99b1jJp
 lKnUdZzM3Qx0/4fXcvkFVDOlblpTAK8=
X-Proofpoint-ORIG-GUID: PKKDXOFuTJDisl3yKJFczRekpZlktnvb
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf38bb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=v5oHNKCaMdnEZ5eDWvYA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260045

Hi Abel,

On Wed, Oct 14, 2026 at 3:05=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> Read an optional Bluetooth device address from an nvmem cell named
> "bd-address" (as already supported by hci_ll), and program it into the
> controller during setup. This lets QCA controllers source their BD_ADDR
> from firmware-provisioned storage such as a UEFI variable exposed via
> nvmem. An all-zero value is ignored, so unprovisioned storage leaves
> the controller default address untouched.

I proposed a similar solution here, at bluetooth core level:
https://lore.kernel.org/all/20261015-block-as-nvmem-v11-5-f890ac74f87d@oss.=
qualcomm.com/

Regards,
Loic


>
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 48 +++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 7089e9b639b2..b704f4c3e1a4 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -25,6 +25,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/nvmem-consumer.h>
>  #include <linux/acpi.h>
>  #include <linux/platform_device.h>
>  #include <linux/pwrseq/consumer.h>
> @@ -230,6 +231,8 @@ struct qca_serdev {
>         bool bdaddr_property_broken;
>         bool support_hfp_hw_offload;
>         const char *firmware_name[2];
> +       bdaddr_t bdaddr;
> +       bool bdaddr_valid;
>  };
>
>  static int qca_regulator_enable(struct qca_serdev *qcadev);
> @@ -2079,6 +2082,16 @@ static int qca_setup(struct hci_uart *hu)
>         else
>                 hu->hdev->set_bdaddr =3D qca_set_bdaddr;
>
> +       /* Program a BD address sourced from an nvmem cell, if provided. =
*/
> +       if (qcadev && qcadev->bdaddr_valid) {
> +               int berr =3D hu->hdev->set_bdaddr(hdev, &qcadev->bdaddr);
> +
> +               if (berr)
> +                       bt_dev_warn(hdev, "Failed to set nvmem bd-address=
: %d", berr);
> +               else
> +                       bt_dev_info(hdev, "Set bd-address %pMR from nvmem=
", &qcadev->bdaddr);
> +       }
> +
>         if (qcadev && qcadev->support_hfp_hw_offload)
>                 qca_configure_hfp_offload(hdev);
>
> @@ -2420,6 +2433,41 @@ static int qca_serdev_probe(struct serdev_device *=
serdev)
>         qcadev->bdaddr_property_broken =3D device_property_read_bool(&ser=
dev->dev,
>                         "qcom,local-bd-address-broken");
>
> +       /* Optional BD address from an nvmem cell (e.g. a UEFI variable).=
 */
> +       {
> +               struct nvmem_cell *cell;
> +
> +               cell =3D nvmem_cell_get(&serdev->dev, "bd-address");
> +               if (IS_ERR(cell)) {
> +                       err =3D PTR_ERR(cell);
> +                       if (err =3D=3D -EPROBE_DEFER)
> +                               return err;
> +                       /* -ENOENT/-ENOSYS: no cell configured, ignore. *=
/
> +               } else {
> +                       size_t clen;
> +                       void *cdata =3D nvmem_cell_read(cell, &clen);
> +
> +                       nvmem_cell_put(cell);
> +                       if (!IS_ERR(cdata)) {
> +                               /*
> +                                * Ignore an all-zero address: the backin=
g
> +                                * storage has not been provisioned.
> +                                */
> +                               if (clen =3D=3D sizeof(bdaddr_t) &&
> +                                   bacmp(cdata, BDADDR_ANY)) {
> +                                       /*
> +                                        * Per the device tree bindings t=
he nvmem
> +                                        * value is MSB first, while bdad=
dr_t is
> +                                        * LSB first.
> +                                        */
> +                                       baswap(&qcadev->bdaddr, cdata);
> +                                       qcadev->bdaddr_valid =3D true;
> +                               }
> +                               kfree(cdata);
> +                       }
> +               }
> +       }
> +
>         if (data)
>                 qcadev->btsoc_type =3D data->soc_type;
>         else
>
> --
> 2.54.0
>
>
