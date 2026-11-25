Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586824;
	b=dIoLc82wB45QMRtsHlnmydZ5x+dwLdtZ4cDU+uBuk9wcUZDVCa9GQdqcJUqpJzFTCIzd
	 uJKbTKslVA/fL/TkEf1n6KDlb/Hl6yokFzBXQKg/ci7JM/p2d+nOV/IMksCJl0NKMi0Xp
	 AWLHCPqK8fBSBZGap1X/xKubHmBD/SZTDMWnoaeBnqNoFp58JLTAzbwpSxU/ptij3SbaD
	 GiYij+a2Lx/gcZWXEM4UX8FN+wqjQUnoUuY3M00tMhT4gG/NcIYXQdTYWCSGJFFLiRwt4
	 AdOBlvgMBhLRgRSeL0kQG+Ul2RJDGfgy2hyPwCds84Sb6tUNz7/SNKkET8XXmL9g2vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586824;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Cc:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S/j/fokvVKGClygxW4zKgxB1rxF0i22APYl8+ucIMeU=;
	b=wx/HSUDDQPNW6oVzXvrWkA3dQSPwGqCCCgmdqSQIycpiHtkWtEGPzKHgrts/u0BUitXx
	 YTssUAgWrevhC7moNUj0HydC6i8THIiGRvBm95lN62odt3qPb1KZLLsI1aAmHdxX2jSf3
	 jmZ6qKgB+V1DglSqQZ8DhTPEc+mKz/ISxB/2i1zbhnQ7FQe9DQOR9+O9bLJ8pdTST/a1Z
	 fOrBNY8/D9poT3Z+o3jh1OEivoycuj8p/MS5aNYsS/c1gzKU+VJHW8Nsi+2je1cz+kpsl
	 duL3d1qC+vZvRxb2sGnHo3+EkMcveCIAoa7aLMjjVtD1rgyPzSVtV0Q0RpMM1rH7SKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=el3yKmm8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e0sMkvGd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3722606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 06:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3722606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=el3yKmm8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e0sMkvGd
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2s6Lm578095
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 06:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S/j/fokvVKGClygxW4zKgxB1rxF0i22APYl8+ucIMeU=; b=el3yKmm8H366C4vQ
	rbSTnJzefuOqwWPVz5gQaLQhXIKkLk3c0+5JKspHcJoYLuTCB/NBQbYvQn4+0/6t
	BSF1A0V1niV45qBCBmOu5K8Npg/MDQ8HPQavJnSLmDpAC3LGxJxlvni819Go97qI
	CKs2NXaiCaBKP1ux3ylCV4YsthF99ql6WvNoGlSp90abEyeJmA93ag1W4x3B2234
	u79gpEjnr+6kO+dafaCmTooT/Rn2BR8ldaM53ka+mGE/n0BlIyJ0G8G7WyGALF4x
	LNMDgnAnFStmRmjpH5Ts7SVBVShtt1IMkIB2MjR1f2+H6GndQW8x8sBUsqoNdV3e
	jLLmyg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa28ke9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 06:06:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f09a37f41dso26742175ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 22:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795586815; x=1796191615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/j/fokvVKGClygxW4zKgxB1rxF0i22APYl8+ucIMeU=;
        b=e0sMkvGdF62FIMQTPgeATiDrrJ76NDm+eBbg+4knWqnRzIlrm9L2aXr429xsroNTDK
         jhJcdhqYLVZR9OUYlI+3BQSl6xI6BlcTXKCSLrjHPE7xYtmAWfMNlOes5S41mdBJljIJ
         83LPwEK6Wgdh5dOGTpJLSWBv2SZpfkJ2hWr7WrWBtxD+J2ajFOmVPdPD9RT0Gj6rYgqf
         gN1U2juqhLxauMqBtHbRAPdcWAVbEFZukgFeK7PkJHRjPFo+ik6+oWODNjjMc4F6mF9T
         qYNtyePPbGoKZkwD+ocACFe9qhWzskWNpCGFf1xks0xvklmS+F99dK/eHv0ZkL+bBwtI
         qzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795586815; x=1796191615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/j/fokvVKGClygxW4zKgxB1rxF0i22APYl8+ucIMeU=;
        b=rpq7k0HoT00l6ixom+aBvFkkplNXLBTVoHuzL+7P9vOs3Oy17JXcV90jlw2vvOq4P+
         llU+EmjTIaxE5Q4B6cmNwz5BjtAmRDGPh0I1DwU0yQ++1XR2TD5dOxQ7r6uPQaktTwYw
         BE8T/3UpiK2NOKxJYfIKiNNJO272qeza/VhzaJEX7ia8pJqRqu/AbCUBtNBctdtazp2K
         FcMrU5wKIanq0Onsd32KYsRijUWviSQysPr08+bP/yxhp0hy/tfT02aSfhqAvTyJG4af
         RNLQbjFU32R+oPP4nQMDQt/gpBhyePGOBrwaBQxJF8k1jxb1SOJEx6IeRaEkTKoG9FNI
         B6vg==
X-Forwarded-Encrypted: i=1; AL+hErGrf9kQwC4dxixLmbFGTObSXnIiCJozXrex6wqV9HlQSI0hAdlF8YkkGG+2bW3m1qF+NqGMYRbepzrgRX0j@vger.kernel.org
X-Gm-Message-State: APuU4Z/ld4RbdrQSzfVdrOo+tGTx+wms4d0DbONLTBw2DbgEUMtFTe4s
	8YpOJtZ3WDsAL1PW6aECjQ61FmlUBNmyVeksL/iLiGYVoXTHVF7niKsZsss9K4Mx2oE0nVBD/2h
	/OoyfIB4PNc1ThwpSfp7wkDfB3iBOkP6S/k1dYjUsQsKmXHV/68Q4SIREop7XRPWfQWxT
X-Gm-Gg: AZFdTZec3/FH9efgt7KpbGT7N6IMJ44J/w8nwXYxAON4+f+gujv4bgsu7vYJZAHUnRM
	gQ1rcgWpBI1bkeRULU7q/uevmK/Dzk6urnhrqss/KG+003okHNBf1ZTfbQ1paor8buvon07Ap/5
	TGqyYXkdpqTIIhgB0jt2zvhFTYU4JyEzylbkGhTwS3dJ7UMRQtnM/2geaUHRCd6j7Sy6DYkIcro
	Ag2ha0jvGNFKX72lFW6r/kWv1H9y2f4VFvSshfI7kfHQPtyWR31o71n0lf4jtmsjsjE07Vq+QX1
	s5Y9MJhpRiqBMbJDfBFTfyob1R+xG8tXAeUw+6XpK1p3psg6F/P5QxWW+t3MMp/YP3/ttLN+ZaF
	LkcJpmtT3eVt/4g0wSIebQDBqQIZancGjzuQpOT9eovbuDCBcYDVSORDPe8taQIaPCiOOLEUNVf
	MDIZJIXhg3l7PJu7Lv2eVef9MQfi6Vl4bXZ6Lrdc1DCWs=
X-Received: by 2002:a17:903:b4f:b0:2ed:3c61:bb83 with SMTP id d9443c01a7336-2f03f1cee2amr178125165ad.16.1795586814784;
        Tue, 24 Nov 2026 22:06:54 -0800 (PST)
X-Received: by 2002:a17:903:b4f:b0:2ed:3c61:bb83 with SMTP id d9443c01a7336-2f03f1cee2amr178124855ad.16.1795586814357;
        Tue, 24 Nov 2026 22:06:54 -0800 (PST)
Received: from [10.249.29.132] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c6e50sm79782845ad.13.2026.11.24.22.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 22:06:53 -0800 (PST)
Message-ID: <3d04aa51-7301-4d8b-93d4-1a7d28e6c614@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:06:47 +0800
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 0/3] media: qcom: iris: Fix IRQ synchronization during
 power-off
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
References: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uS2JqF3yJoPh2GJTvsLitECRFbJ9GpRx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyMyBTYWx0ZWRfX8qPON6tNErt4
 x5HQowzKN/IRNiu45auFL7HnA7C8qfmoa8RZCeTSTuBPApKkYRDPqS9ccVV79zVrcvQNN033LFi
 4UtYmHDjNEHpF2Lk0WxCt5UguVQM0IU=
X-Proofpoint-GUID: uS2JqF3yJoPh2GJTvsLitECRFbJ9GpRx
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b067aff cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=F58wanNFIcC05fkyUe0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyMyBTYWx0ZWRfX7IAsG8bLKPX7
 Kfa75me6sW9MMnA7vMKVrAZZE6l5BwMsZniHqcsCs224FUmfV9Ut+MlK4210cv+FdP0L5rX6q9B
 xFFS/Db66ed66CYv2nErUrQH42XQYlug2bwT0kZcFo39TahbjODvdk0XPSQ/EevtxzF7+aNxYL5
 UhnlMQOWRPYAwjsgjas84JQm4y/q/VqsclfJuNM5btRkrUVyBhtLnIf2mMudu1vHHeJer0IU8kO
 ib05mGK/YU8tzQDnbu8fn9W1J3zjv4APoIynyy981XgBHb9PZjz1n7/DkQqo+vg+83IfugS21Ce
 y1FtjLQaAcTtVptzxJOjndw5ofo2Sn0Awt2368nQFkBCFM8zJlxRfwhIyeas1/HLzPzwYxA90qe
 M0bGEhkSuN0GBZXSn8R+uPijTX8Hq55sVAfRAppEGT4mjtPnuzkSKEdXofxpJ63oe82OOCJ86oG
 DUtMzttevRTaK5718AA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250023

On 2026/11/20 15:42, Vishnu Reddy wrote:
> Commit b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during
> power-off") changed the VPU power-off sequence to use disable_irq()
> instead of disable_irq_nosync(). This was intended to stop a queued
> threaded IRQ handler from accessing the hardware after power-off.
> 
> However, iris_vpu_power_off() is called with core->lock held, and the
> threaded IRQ handler (iris_hfi_isr_handler()) takes this same lock. If
> the handler is queued when power-off begins, disable_irq() blocks
> waiting for the handler, while the handler blocks waiting for
> core->lock. This results in a deadlock.
> 
> This series reverts the commit that introduced the deadlock and fixes
> the IRQ handling around power-off. It keeps the IRQ disable depth
> balanced across power-off and power-on, and makes sure a handler queued
> around power-off does not access the registers of powered-off hardware.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
> Changes in v3:
> - Used IRQF_ONESHOT and dropped the manual IRQ disable/enable (Bryan)
> - Avoided the irq_disabling flag, waitqueue and unlock of core->lock during power-off
> - Skipped the register access once the hardware is powered off
> - Link to v2: https://patch.msgid.link/20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com
> 
> Changes in v2:
> - Added new patch to handle the irq depth
> - Link to v1: https://patch.msgid.link/20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com
> 
> ---
> Vishnu Reddy (3):
>        Revert "media: qcom: iris: use disable_irq() during power-off"
>        media: qcom: iris: Fix IRQ disable depth imbalance on watchdog interrupt
>        media: qcom: iris: Skip register access in IRQ handler after power-off
> 
>   drivers/media/platform/qcom/iris/iris_core.h       |  4 ++++
>   drivers/media/platform/qcom/iris/iris_hfi_common.c | 20 ++++++++++----------
>   drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 -
>   drivers/media/platform/qcom/iris/iris_probe.c      |  5 +++--
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |  9 +++++++--
>   5 files changed, 24 insertions(+), 15 deletions(-)
> ---
> base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
> change-id: 20261004-fix-disable-irq-safely-15b2f712800b
> 
> Best regards,
> --
> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

-- 
Best Regards,
Wangao

