Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793629216;
	b=Nx7MMl2vhOAjVMGeiw9dqbgegD+L5hPXqR2o/UKhte3N4HbsMCRa/qsqhj0JRGwntXzW
	 Vu97mDuHrMRSyhSUmPNFo5Wy83z+1Ww1OXlQRQlqtlualyOFTiT0S9xGAOsDnD+5r/cxq
	 YUJG6ieHoltrQzxD2UtPngYph7ppyp5uG0I6bcKkCzoO8ojGOObaV+eNpMdR7amJA1iwM
	 XqGKb0tpq21yRxlS9buz7u3GeG7wqVSs7zFs+xg1MQ/G06NiF9N9tBrXNeJhP0p2vy9pD
	 i09KZq9bTX+MIqEmVUVm8txpuoe/DopeDsY0YptK/bZ7uYKTMhJ04dzY/GSnIb0vO0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629216;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8n7dSKsJ4gHFEifJ89KDv7QifUTS087R40TTFpOWIZs=;
	b=eNIWv0cqguSsZt8Q8GNYOh6pBHCuxqjzVJMEhOIJbpuFps/8Mt9WSuIy5Qr94BGBgB1y
	 bsyspERPg8v2dY5ARZfrze8gPZYcNcJj4P2QeIHtRvsWMK1xcHvAx2BkpyvFeaklx6cE3
	 WcXlUrt7wqdCo+VCY+IA0zmoykdPvJQkSBmu82tf61zGFMQM99wafO0i0+9Fl7HyL/Z8W
	 wd6gTmaLCuVzQN005eCH+xwZGWKylv+gM18dvgwJwX4WotAlBQ50r23gNApiw8WK7pDRX
	 +6ScnZkzg/ohndxW9egj5TJ4YH41LbCebnVYihkGCVAkFyYJeBVJ3k9ewfEtfQMEZJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W03LZuFx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OIH2ZGYn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1D3606A329
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 14:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D1D3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W03LZuFx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OIH2ZGYn
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpLww2448586
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 14:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8n7dSKsJ4gHFEifJ89KDv7QifUTS087R40TTFpOWIZs=; b=W03LZuFx/ymfbxYy
	QVP+06O8DYB9kyjyvU10sNWQkwlZUwHbMBEV4DNqrndrH0dduH1BGYeNyGFzh5wg
	P93HcCgSCOYes6+hXxjz1VxN8jOL6F5q7fdOdeth9pPfBRhyED36Y8jXkdeAuI0P
	ADPuDK1RBVj7bhKzdXYMyZaJ6dahYZuXHGxhAgcz0/wk2uQpMHUBAX8AAC+5DKQ7
	Tr7zUTFzyZIhLi3nc1Yb+FaIOMWj3TmdYzMHv2uxORrUhI2MEeDu1NZdWoohP5s1
	s+fzpZIVqhbifIzGt/L7X4D7e22sFm7F6hKkcdupAzEAJZNfJop76iVJJ2Wry+KX
	hHgauw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4j27a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:20:14 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c467e19391so4754253b6e.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:20:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793629214; cv=none;
        d=google.com; s=arc-20260327;
        b=Pd7+BIfY8/M42nJxeoPTKUMIyXOQaK6luwVqN7FpglTxcGfoZChIjy6BpyJNKkIt3S
         T754G4cYZEmuVQM7gj4ts0t2eCrtY0v4ST/eAu1RxM6SmCS1r4xWVKtVe5Ty9NZ2sboE
         DcdPEi3fmAIXD4VvFXOtkK07f7vh98PNLAcTeBbNzUadprs/Aus8Kd8Hbv7QgvvCEKkj
         dARpb0FIk4VH7GEf9XkkYOkwQzUAZP7EeBWXjnxe3rwCjkokzKZvlKO3IgjJuPMLpe9t
         UrVSsDpuU08MIBiwWJBFNjxO8Ke5WNQnVFmZ55ERhqZSS+WrXt2k6ZzpykwMLDXB3lu6
         ELFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8n7dSKsJ4gHFEifJ89KDv7QifUTS087R40TTFpOWIZs=;
        fh=/8+JhakeN7vZanfaFLvf8QTICoJziQU+CyvwmeF3v6A=;
        b=LKR3tW+H5Ew3/CXDqww0bC7pGyomBDf5txdh782m7Gry46j0pnxq3wfFM8itNVs/uh
         61iC8Qtpn+pW11Osn06MFZwZTSG34Vjc3JEz4uN1ymBhsDUutfdSccTC/Is1Ej1wuXpk
         YhP8Npi4NTIhUI961q/6ehsrASdFoKa4gcZZQz10QmD2PVPcKoiENlStSdJ+V4sFA0+V
         Mbuj6adiqGidADtCcPZUQxaNAAQArlgY+HWPvSBYHkzEq4QaoiWTX1RhXkXv7G8GU+8q
         6xTki4j4i2eGif6a7bI6ewc2x6ZUlInLnddB0b1LJM378waCPCzdTPZYzlolnPAz1F/O
         MniA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793629214; x=1794234014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8n7dSKsJ4gHFEifJ89KDv7QifUTS087R40TTFpOWIZs=;
        b=OIH2ZGYnpFvjQRv2iWuTrSmuyrv2+dqgkMyhDiuZt86z+ERrpJxENnaqvHG26SbvVZ
         deKCnN+ZKlwe6KQM98w1LKoLYJk9QUavYa6dEodg+HDzMMn5gm5QAVS3hD6CpQqRTwXq
         pLi/lMONKf8rT3NXuN080bqQAEhVo0uv8AS9UuGQirZysNS0fljWIH0XY8RiXYNy6eMG
         4C0xwgZAVwpVJ+YYs8thdefQd+9s4yciodky8UnRTemcYfx8T4dY3uvibwrLUAs7swK0
         DQDzYfW7UQ4tGzcMOzArFYQsh/69GY9VK2kWSR4ilGJZQLWoYTI9vbLkmP6dBju/ScF4
         M+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629214; x=1794234014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8n7dSKsJ4gHFEifJ89KDv7QifUTS087R40TTFpOWIZs=;
        b=UN4wpe3pt6c+TrXB/anjbTzZAhuTr0EVDzyqeG91ENe414feL2U17poR8y0GqZ/WYy
         n1AV+WjpjZ3b+9tcAmzjwBdaPj330kgENvVORXQ+H6Zr/F6mV+GVVhwMMY7MiFZKwaod
         xmuDxF6JR9g5P5QxvCGZ7mGbePyUrQSAtLcp0E+Ajbi3Ax6pIo5scyrq+oG3r3fBzS0f
         57gjy4yG2ZnPFHo3Irxn+ZA5Mv4nH5BCUAShNLKc2ze0rVowbpQA0UZUCTu6vNBcMWbv
         nUtv7/CYher5PPOZjGNMuzzYCDq25nZTeEG/Nuncg8uCFfgloK0qXrvGyHUxilUNS045
         pUlA==
X-Forwarded-Encrypted: i=1; AKwUvByon5iPzidoNBSmiUl0OJbdzx5/qWIxn++0O+K+PLU0mAWwNj89z67uJq3ae/pwgTISxNwDR23lAM5NJzXd@vger.kernel.org
X-Gm-Message-State: AFq9FYKAfLOOa0pc/NE20VfaULmnyIg8ec7n3a+Wr8w5YLmzFD6D62YA
	JRTFDEcQbJwNn2iidpQVPTgcRg/bks4N/Z+iM56yBcA731VzIWcA6ormGm4cTKbU4jt2uAjom6p
	oqKyQ3uVMGXaewVqczylHBuj8KCF9/F7SnKYDjQaTVCeOZT/kAUu9/VM6btMTKP0y8y8vDK5KoG
	XXcgj0VUhKkgSoaODatyo89qI+asx5vKiEXYXGzytEzgw=
X-Gm-Gg: AYBFou1LCNVm6Pqk+7hh9r77jwa6ovXMjKbpNRIYEsE2OvEgRvgLGy/L4t7JiE67zvj
	oZ0/HfrKOQb93jnD/BvHGqUhYJrKBAtNZF7uDUt8CyFX/WX7ubIbrRSFGxEditukGO7zbOdXuFz
	b4wXE7Rm4lznTHehIqWhJYMMOJns4nYxoxsyPnq0eKJFkwA95Dp9pdnr34sud+KkkrlZFOdnvV2
	+73NshJdZowlPSlcnf3RKIcx8nuOVx1UqgsqaFZUx6uelVJ1hNfAx/KgKZ3d70H0OTE4Ny67Dg=
X-Received: by 2002:a05:6808:1a04:b0:4f6:5279:5c75 with SMTP id 5614622812f47-5640dcb93e5mr6416254b6e.28.1793629213691;
        Mon, 02 Nov 2026 06:20:13 -0800 (PST)
X-Received: by 2002:a05:6808:1a04:b0:4f6:5279:5c75 with SMTP id
 5614622812f47-5640dcb93e5mr6416216b6e.28.1793629213180; Mon, 02 Nov 2026
 06:20:13 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org> <20261102-v4l2-frame-sync-v2-1-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-1-25cbed7a772f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:20:01 +0100
X-Gm-Features: AclHuK9ZOhS5EjLam-kJywbKLlgi5wGv4m77X5Yw00ydy_7TMI2tMaQ3gudROoI
Message-ID: <CAFEp6-34V8YQM7WVQ1BHDnb3vOv2MmPxAw8N-H-wQMe6xCnxKg@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] media: qcom: camss: Introduce CPU latency QoS
 during streaming
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: GYAYifXwWQolbWskhaO5qlBl0SBp-pKE
X-Proofpoint-GUID: GYAYifXwWQolbWskhaO5qlBl0SBp-pKE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX6e2oAsT0d+eq
 C8a6wKa2Ds/8gh2AN32x86UX0EScy2UbcgNCnjxVECq9OCen2gQUJyb+R0erpJr/GxqODLc6gjG
 IIKHThgOi5zKYhtvw3f98LMFacwJk4U=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae89c1e cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=j5BrblYcdOSYweWB2fgA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfXzH3dJ6s13UsU
 Smnl57fwvdNbTDQQhjqADqW4O+mcKrSrv2XguOYdaEgQ3yA9uWKSmf8OffK9rYTU/VwS6/7Bidf
 O0hQ1PuAalm/+YyQPQTwp+TR08LDY+YFmlNWD7QCYsOXkjnx0WhhOtSq5TVd1bNHObDcY2IQus3
 S5ncoDn2moDgYALte/G4VC3RNcKWKZ9t6/I7wO/o/+dl70WOxomjg53QDAUGdXnA5/q5ZZeOmXp
 TyhzdxO5hhbWFqczR/5ZkHwkyFUrbqAgH2G9RK9T8u5BX4gJNlKXgCkfffAjY/7BWITWP7ah47r
 QF84ShNuPAhZs3xWiz+lYhKWowAX0cc5CnHgHI8J9MDoomSlvK74UU7E+dCMoN+m/BF87Ju7qPz
 4aX816d1IoLBPd+DOoM+QyMA/VB1ugNGDEDDQe2b0OXt4XmkqTZ+g4DPat/RgQMNN+VaGFmhLwB
 jOUr33iuQ9pl4/3nMPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020057

On Mon, Nov 2, 2026 at 2:57=E2=80=AFPM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> On a quiescent system - for example the X1 CRD booted to a simple ramdisk
> rootfs during development of V4L2_EVENT_FRAME_SYNC it was observed that
> interrupt for buffer done could be delayed until after the SOF for the ne=
xt
> frame.
>
> Fiddling about with the interrupt bits, clearing them and changing the
> logic of V4L2_EVENT_FRAME_SYNC to buffer completion didn't work and besid=
es
> "felt wrong".
>
> Tracing it looks like this:
> <idle>-0       [000] d.h1.    36.374380: csid_isr: rdi0 sof=3D1 done=3D0
> <idle>-0       [000] d.h1.    36.406601: csid_isr: rdi0 sof=3D1 done=3D1
> <idle>-0       [000] d.h1.    36.439910: csid_isr: rdi0 sof=3D1 done=3D1
> <idle>-0       [000] d.h1.    36.473245: csid_isr: rdi0 sof=3D1 done=3D1
> <idle>-0       [000] d.h1.    36.504786: csid_isr: rdi0 sof=3D0 done=3D1
> <idle>-0       [000] d.h1.    36.506350: csid_isr: rdi0 sof=3D1 done=3D0
>
> Tracing with /dev/cpu_dma_latency =3D 0 looks like this:
> <idle>-0       [000] d.h1.   556.149115: csid_isr: rdi0 sof=3D1 done=3D0
> <idle>-0       [000] d.h1.   556.181338: csid_isr: rdi0 sof=3D0 done=3D1
> <idle>-0       [000] d.h1.   556.182880: csid_isr: rdi0 sof=3D1 done=3D0
> <idle>-0       [000] d.h1.   556.214643: csid_isr: rdi0 sof=3D0 done=3D1
> <idle>-0       [000] d.h1.   556.216185: csid_isr: rdi0 sof=3D1 done=3D0
>
> The second is the pattern you expect CSI SOF followed by data.
>
> We will require SOF to track and understand which data-frame is correlate=
d
> to which camera stastics and parameters frame. On an ordinary system with
> several things pinging off at once, WiFi, display, keyboard you will be
> unlikely to hit deep idle and hence unlikely to see the long exit. Howeve=
r
> we should design for the case where the system is otherwise quiescent wit=
h
> only the camera streaming.
>
> Choosing a request of 300us - 1000us seemed to work fine but cutting the
> margin finer, similar to the value on IPU6.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 11 ++++++++++-
>  drivers/media/platform/qcom/camss/camss.h |  2 ++
>  2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a9..52bb19f5fbf3b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -5834,6 +5834,8 @@ static const struct of_device_id camss_dt_match[] =
=3D {
>
>  MODULE_DEVICE_TABLE(of, camss_dt_match);
>
> +#define CAMSS_CPU_LATENCY_US   300
> +
>  static int __maybe_unused camss_runtime_suspend(struct device *dev)
>  {
>         struct camss *camss =3D dev_get_drvdata(dev);
> @@ -5846,6 +5848,8 @@ static int __maybe_unused camss_runtime_suspend(str=
uct device *dev)
>                         return ret;
>         }
>
> +       cpu_latency_qos_remove_request(&camss->cpu_latency);
> +
>  #if IS_ENABLED(CONFIG_PM_CLK)
>         return pm_clk_suspend(dev);
>  #else
> @@ -5866,12 +5870,17 @@ static int __maybe_unused camss_runtime_resume(st=
ruct device *dev)
>                 return ret;
>  #endif
>
> +       cpu_latency_qos_add_request(&camss->cpu_latency,
> +                                   CAMSS_CPU_LATENCY_US);
> +
>         for (i =3D 0; i < camss->res->icc_path_num; i++) {
>                 ret =3D icc_set_bw(camss->icc_path[i],
>                                  icc_res[i].icc_bw_tbl.avg,
>                                  icc_res[i].icc_bw_tbl.peak);
> -               if (ret)
> +               if (ret) {
> +                       cpu_latency_qos_remove_request(&camss->cpu_latenc=
y);
>                         return ret;
> +               }
>         }
>
>         return 0;
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 7dc2fd9f03e0d..7564a7c46fa24 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -11,6 +11,7 @@
>  #define QC_MSM_CAMSS_H
>
>  #include <linux/device.h>
> +#include <linux/pm_qos.h>
>  #include <linux/types.h>
>  #include <media/v4l2-async.h>
>  #include <media/v4l2-device.h>
> @@ -141,6 +142,7 @@ struct camss {
>         struct icc_path *icc_path[ICC_SM8250_COUNT];
>         const struct camss_resources *res;
>         bool legacy_phy;
> +       struct pm_qos_request cpu_latency;
>  };
>
>  struct camss_camera_interface {
>
> --
> 2.56.0
>
