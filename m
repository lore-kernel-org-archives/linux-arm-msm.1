Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920680;
	b=rUXAkYW+ZYYBtFMxT5C063I5mEUrSZAMcaK0DjmKG6m2QMKz7ahyf1wtkQbzzyCgFWfo
	 TlDdl/MZ+w+Ysl5rCCjGeB42f8eJBVksNO5x7OkN+efVu11uAnFzMFnwQxXYqPm92C61F
	 VDYBV8y4ql8fy86u1oeYNefN5hDptMbuom22bzK3P9r8Td0oytncAutG1yTny0pn8C26V
	 f8Hkkxxg9sryvaZIo38nGdgbjsE8VtGL7B3qRsaW87gAOBejpPsew47fM2I50Sk23N7se
	 la7Hfr05dlIqCkd8eV+9rr11cTMaFOELOkfLYQavjAniAntm+0Z05qRrIJY/C/7OJlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=M7amDaHq46OmFusBtrG1r4booozfmEGG+N9voZpDUdo=;
	b=zc5F+df5TXGobNVjOebqGozANm6/2n/QDSSjkc+hR08JZrbSU3VwtgSYbZWxKKMKXpZL
	 oNA73dq1N8HCtVA33mVXKdaDollAtVB4BTPGBO+sua/EapIa42Nhg2Ue4gxmpZfgvrE89
	 M1f0vYX1uEvflqj7GjKZ8I7wQxeduuPONvcMzOkzvLQrZsXEUyH99OlvFEWq6xFGqvUpK
	 4opZa9G3sghJr8hOS7pnEVertNVqTv4IZymdqQqg3nnYsB9rWapYZ1DtyuHveXoo/yFRI
	 RvFqxXcZaMTqbHM7OMIXcYwRpnb2h3PEGNqv4ej9L8zQFWwjtFevYgwbYLNAlaK65bA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SYkFQOP0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OZ2b5Hhq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CE0606A335
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 13:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9CE0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SYkFQOP0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OZ2b5Hhq
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC0ltw1457338
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 13:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M7amDaHq46OmFusBtrG1r4booozfmEGG+N9voZpDUdo=; b=SYkFQOP05yzwfBmQ
	5l84X0HWUxtGj+hF7Gw5J7foY6wyE8XXvtl/YCJLSjRsEnoWLCJRu3B9DxflQr83
	Mrl8GfwE3Et2CMKPTXRknXmSoXtjngcpp7qHLTkn4SE/CM/9BBdbLdUQ4NpRewtf
	xXmf4TYoc44juksX6PMyuRa6SIyqFjVSmk7UFIHv/WAKHzfnd2vFcpyCgZw0IL6k
	JZ06icBis88H4HnsKh0zgFszN/+otSR4iFEcVdYfCwu17GaEHZyJvnkAp0W4GpfH
	heNLnp+6PTtvS2QO8t+rQaiNcvIy0L7l06rpvHRPobW1JR0LD98ef3QGpHZQxBa8
	2WjaEA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0nc80hx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 13:04:38 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8255327a28fso5173256a34.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 05:04:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794920677; cv=none;
        d=google.com; s=arc-20260327;
        b=DACj+0KUcCnh5W6cR6OG/p7IrZ51djLRt5EJl1wWt0Trfb3kzBmZSaA7lcWXAX90Wd
         kwcOJmVr8oY5aI2C+4O1FN31IVjLNpZrO0VbE+lSKBfyYkTUZGDbWkYa4oF2YkBbQfB/
         fzbFjHtkO0xFTDQAR9B60WqJmEDNHk4wNhZ/ZKJR8bUgDGO45RYcFaH/3ZGptnqpOeOv
         7pr2SlAewJxCoTwB6qDE3dhQi3pV5xrIUPwdRPmFb/vveuKMvn7xCIFTna+Qn4CF1lJa
         AI5ff/XbkIHlZz5FFDhVi2mNvHbPZas1lytSCoiuuP+CTgV1osQS1PI8F689mqP7Jh/k
         JSHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M7amDaHq46OmFusBtrG1r4booozfmEGG+N9voZpDUdo=;
        fh=6J3IcdMTvbhd1upeBNQqnI0+SelwW+a+SbicKyQ3Eqo=;
        b=f2uW3aPmyVLnzTGyr7SbAxsS0xV5QhqqWzDLEFHBR46DScTLEWKFhaNyjnziNV1sGM
         IHk+GCzTmcszfpsr+4tUk4f8RVOJheZBdimZh1P0nwULQQQM24VK513RXMIDV89646Pt
         KVuGtytfqVgwUwNL+tlDo9eJon0VOWIPz4Tughn0EEzOx6fdG6hoKZC9gI+XxrTOvk6y
         PfPZAg7u5K0X/45J6Y5P9bnxUP16RBT9gaK0jAgC15hh8JwZrAEkklzPI+LAj7iG/yL7
         cjBxi7pNOKI6C0QRxi7GhiQQzHEc8EXCk7DglPZXjEZiIA61tT/xvHNWpciviMq1RVsC
         cGCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920677; x=1795525477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M7amDaHq46OmFusBtrG1r4booozfmEGG+N9voZpDUdo=;
        b=OZ2b5HhquMuAVi3NwrIjBapqGw5RGv/p2i3Yn8QoRXTpjqhKrGSekEJojXq887MGkE
         fcME92t3Q3m8jTXYyrxoYKhoFB0+b41B5zWZO0oyINj01KKy5XcuzS5BP3qvVworpDSt
         6Uh07oewqxtGFNoHXs1egK4q77dPqRi12HzSlfyf1LShd1OeDrAxKzMi8Q5O1/e1ftDv
         vDK7lgn8M4UFV9QffEOqZhtVnGfH1u5fE4+ce5ag0UHHxUIv0fOdq1MznRNpdi9bhOsO
         3ch21vz0jV2GBpaj2laSfS0oX6Mxy0P/hxeghky1j4Q35J7CVwNDyxg0TVwuXzhQVh6F
         ZcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920677; x=1795525477;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M7amDaHq46OmFusBtrG1r4booozfmEGG+N9voZpDUdo=;
        b=0naOyJoIsc96wh1/RjRHRAmWVjkvta8G4rPjP7AVxdZtEi+z0UxwtVRwNk4b7j//z8
         8B3n/+RnZmunJBLeSpmrumvmkwgFikuQT615Im1JTjiCawlPvzkYegUu0IleT8LTzv6E
         63iZzEfRNKwy2aba77dBmyOwW/vvg/0dxZTNQVWTESqdMb0quOXFcev8RTFgd/dmLONp
         F4OefMP5cjPTuVE9ZZT3LeRJvnsuTL9fHcFaUJv93ABH12hddUjlgfM3ClZPmKSFnia2
         R6mOKYrvwUvvrVJgk4SL2KnOlNb2fIQfDGWOMlzM9wDosWf489YbvQQJXMV+PnOJbOiQ
         lYxA==
X-Forwarded-Encrypted: i=1; AL+hErG4doY5uvTuNyd3HMZGkZofm0VIuZ6aXNnyvSFB+TteSKRnLdD5//7BRGPSwSyGDIYeQ3zXaospGDjbP/ww@vger.kernel.org
X-Gm-Message-State: APuU4Z/1R4tItNQl2AVNs+BpLUm18sx7KGce8I7id/yjS8HPRknUIHfE
	cQxqwh6QHIRuB1dV0OCuRECGcgVfyp8oRs/GDxN/TG3j/TdF+mdqPLVbUf7jij1ea/FqEg2KwL2
	EEiE/4VJY8HrLsvKTDbIEV/Wrnbxq5jWajEjnkUOACpKqgrVUGs62mNAf+U/tnHdTiftZ+Hg2Sz
	oXlHkvTwpv2U4rm1dzRMR7m3moU2+ynrlr2AvlON0OE+s=
X-Gm-Gg: AYBFou3ANbHJpxnX/RhDisCujvMAr/sGqRo7e+hgSai6XQC5YavGIUFiUWGrrCZnUmE
	LMPUH7EhA9cxW2SYD9BoFgMIpfyTwM9S68kr2VyIMqiqEOzvrq3BeiPudDTmztZO1vwf4GWhM60
	uZDdXvyb4TTkwhcoqv8pwAwLkGgxCWQFNkeYJNLLY4arXFYXgt5ErV/7ctW6kUjXmd2gu0vgkXO
	gXTDLx3JFg2SEnynGuYsp44c7cIe8wMeuY8iVau4gRo0Luqy5Py2Zp3+wq4irmOwWlLE2baJRQj
X-Received: by 2002:a05:6808:f14:b0:55c:127b:b769 with SMTP id 5614622812f47-56e641d64femr11065176b6e.32.1794920677485;
        Tue, 17 Nov 2026 05:04:37 -0800 (PST)
X-Received: by 2002:a05:6808:f14:b0:55c:127b:b769 with SMTP id
 5614622812f47-56e641d64femr11065153b6e.32.1794920677100; Tue, 17 Nov 2026
 05:04:37 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794905977.git.zwq2226404116@163.com> <dee0cba42234dcc193c59e7847cfe1a8daf6ff3b.1794905977.git.zwq2226404116@163.com>
In-Reply-To: <dee0cba42234dcc193c59e7847cfe1a8daf6ff3b.1794905977.git.zwq2226404116@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:04:25 +0100
X-Gm-Features: AclHuK9K-5DuIleq2c3acuiwkf7IKa5obuGwZtGKAK3ggbCHmu3QWH-ILx8kY-I
Message-ID: <CAFEp6-3VtgV7QLBVjrsHpGRo4MvzZV5KVAYiiZjYJrz9mApHHw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] net: wwan: mhi_wwan_ctrl: add ADB channel support
To: Wanquan Zhong <zwq2226404116@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=LaipeTfi c=1 sm=1 tr=0 ts=6afc50e6 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8
 a=Nxhiib172zSPVyf_-JkA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX2y7KGDzAJDmv
 Sh4MBxn4K+V+PeHRRwolJPfUC74DB4jsvLPIGyW+OoVxKgAhvFg/xQfTgayySJdS8fFZ0yIbA2l
 ForgPdxUMueJMJFHnJOW/8ht9SDNGcc=
X-Proofpoint-GUID: FCoX5hKDaSjaG6qobOdUfA1VNmcxXFQw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX2HB2CZMbTesT
 mPrKGdt5wOmaqS0JXCJCgOeaGNrXl8wpcMk/A2gUUXFdSz7PiJ32T4FYMVCZKFL9nGfzAlMu1B5
 BTKUhnwDvgraVU0z2rQjsbfjM5HjM/VvS7GgmENfL3qDeUFlRfn4g4FNtcUAt+98E/ErIrOEvSe
 AwhNOzUyXDU1EKKpxMz5ZiUpKdzjaXpWYjK7roP95crEaLSNSlbLqBtOVLfnTSrB6qcr1SvN8ne
 kWPpL9YTtOWmI3CxMBbs7IzceoMPmZDbzTtGNtNditiZC5KtvXTDMFjrPnGi9T7fVPGhJI97VDz
 F8d1YGJ8Ll6GQwfZXSMsJ44+MORKEeScHoqVNZ+S1V7uo9O4cT5z7rjV0KaZZ4rA2JX1/tYyK5/
 ahDpj2wFDRLYqLV/vSzxIGeyMDix1/I2MrDJfe4qgGdJRgJqw8qp0jzjcrNbck5QKJaIlcXGFx9
 fPX3AadCW8GEviK8SGg==
X-Proofpoint-ORIG-GUID: FCoX5hKDaSjaG6qobOdUfA1VNmcxXFQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170051

On Tue, Nov 17, 2026 at 10:14=E2=80=AFAM Wanquan Zhong <zwq2226404116@163.c=
om> wrote:
>
> Bind the MHI "ADB" channel to WWAN_PORT_ADB so userspace can access the
> ADB port through the wwan subsystem.
>
> Signed-off-by: Wanquan Zhong <zwq2226404116@163.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Unchanged from v6 patch 2/2; bundled with v1/v2 historically (Loic).
>
>  drivers/net/wwan/mhi_wwan_ctrl.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan=
_ctrl.c
> index a31d8540fbb8..50a3a940357b 100644
> --- a/drivers/net/wwan/mhi_wwan_ctrl.c
> +++ b/drivers/net/wwan/mhi_wwan_ctrl.c
> @@ -263,6 +263,7 @@ static const struct mhi_device_id mhi_wwan_ctrl_match=
_table[] =3D {
>         { .chan =3D "DIAG", .driver_data =3D WWAN_PORT_QCDM },
>         { .chan =3D "FIREHOSE", .driver_data =3D WWAN_PORT_FIREHOSE },
>         { .chan =3D "NMEA", .driver_data =3D WWAN_PORT_NMEA },
> +       { .chan =3D "ADB", .driver_data =3D WWAN_PORT_ADB },
>         {},
>  };
>  MODULE_DEVICE_TABLE(mhi, mhi_wwan_ctrl_match_table);
> --
> 2.53.0
>
