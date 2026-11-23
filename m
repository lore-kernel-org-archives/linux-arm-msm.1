Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461615;
	b=WlLAwSlu979r9EFufScSoTMio08C4E61zuRtDnLc7AIqtohsedWeOIVu034efmU48fvM
	 MmOTajfxX0uoUVIyLywdbCzxykECsih3XiFZm/9D2FUJr1Yg6eFP4Hb0t/KeiWB0J0elc
	 SSmA3GiHYB0jIxPpAWI6sHu3cTd+afttmKiODjqcf5CItZ911SWHdeSKpVzoq3SGWiStV
	 kDSl0NQrU+xDiE/YqYdOcjfhy5mdbOCZtpKXmGxaRlIkpxyiXiK8MS8AYgERl6JHYPGVg
	 wfpnIdTXkOQUEef4D7sM8Aabduy1QG0i1Y3QHxwtO8E710E4J1qtJYgIRbh45m26gAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461615;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=u14gAEo+bgmbBRpH6u/ppslzcwxP+mD5wjPj2Nc0SNU=;
	b=PA/tNK1xKvNDk87btAPlTxxdHwZF1tF+KBHdJpe37i2V9ahImig/FGTaDNpXiJgYwv1n
	 WX+oGGqFws+hhmOdSnM8ReT8DX3RFeZ9diLPv4U0Q2P3AuJLO63pIql7dQhK0BOc8+pQ6
	 QrlZhVfmeOu0qqvtyfZC/sWbZZhxg2O0r69OG33gMJpOxx/fu7tyxjXGlsZdoUu2Rs74n
	 ZF16ZE87Ys2CX9zq/YeiCoBlK/ZwKAXeP8Vx/m0jMx4DPxqAQmR/rAbxvESnwA0KpaiTe
	 MyjxU5zMczD359APmeBsj9P274y+bbVwDuz0gziNa8MyPhluzkN32IVPtOw2AW7YWoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MaG9ePiB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iLJgLYKb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72840606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72840606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MaG9ePiB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iLJgLYKb
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGI0Pn236158
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u14gAEo+bgmbBRpH6u/ppslz
	cwxP+mD5wjPj2Nc0SNU=; b=MaG9ePiBTqPuVzhotNxHqFYGg6bNmF/PJEyV2L7/
	n3wRco8WYIePu+jjpGsFxR4mH+HSrCZe2zryTYxGrSnpqPFtWcSNLeupcoE44KGv
	0RFWFmxM5wf1HAtsDzp3rkdJzzJ84DUdRIWI8ywnOVwb//gq7QY1+GxDJyd36+5j
	m8TFkSMI/+2Z3Nn4AqDB5fupDs0x1A9HgnozHidr//e3fZEH3ThEC0lXs/IC1egb
	yEHluimctKIvVQzjro+tlzpESTvw7S87d1rYgsYDAHpBxUa7Yfw/zIEx+eVz++oH
	kaS0A9T/TKkm+Lj5hKV0OeFOUZ5fXzTCFhwt95Vriw1MEw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsk9fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:20:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3969a2a7so553435685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461613; x=1796066413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u14gAEo+bgmbBRpH6u/ppslzcwxP+mD5wjPj2Nc0SNU=;
        b=iLJgLYKbpWxlC2hIQac00iL4hZ15A1k+0PVWpn3HDwAOmAVpTCU842hhGE1Q0/vl2Q
         pQqit3G0rYIrEYCFrotPldPvMV86vWMHurbtuCkGJeI9FROThEGTl5CQR30Ga0KYXQI4
         XgHmf0dCSkIcNG7L+dbGtwuf8aYLfq7OaoasTTnvnT2aM9QPmmzpjm6FXDprqlv9cNPD
         hiWe6cViT2u8ypLIMqdBYikc9WwV1Tz03EoHsOcoM6BcPGAP+v6TKlaFTmBD+/xgAow2
         mAjN7LL33EQeCFfU9P7zZd7haXjFpQdPYJttzTQeVZNCeVBW2li0jHufS2rQRWwLsWCC
         Wr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461613; x=1796066413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u14gAEo+bgmbBRpH6u/ppslzcwxP+mD5wjPj2Nc0SNU=;
        b=Xj3Xw7gqp1irRkjBYqBOfpssuXL1s6dA7LoHR9oOywfNchpgGMM1WQd6dExcuoToBW
         qYWRtxmsffSXMD3t+76KV+d5rNqcConkyQ2KIdCMHjP5DNwJkJdcSW2TO1mjJC1Esq+L
         AdvXglTMrpQn7D2M9Vlu95tBNhs1DKgGDaOcHFa2KxIH84TRb5O9wIWrDv/7TK2K4tFI
         c9djPpGFmTh3mpLl2FbdTBStlLXa4CXjGYd8MNzuBlnj0IiujO7DEAHOysdRahe5wZ4g
         esUPDWhbT6Z6SHSXX0vhh3bf6kq6Kcx0CaeIERFusZqmpTqOX2PzRgyvDIz9nW5mN/50
         TzIQ==
X-Forwarded-Encrypted: i=1; AL+hErG13Zqy3hJbAlc6CkR018VHvNmgSFG1EGeNpF03WOxK782Erq2oTf9wgV38Mqfh7Wo3tcAZseWkaWpXlL1l@vger.kernel.org
X-Gm-Message-State: APuU4Z/g2DY8279SsLP+Xe8tL2pxV+m2L03hhTm41F70mSfb3IL4fd5k
	X6TWRrPhR2Ctp1ZSeGGissDM7a5Ph+kMtkN1SQFd7V0e/XM9o7M4C/NLe6OldZPgAhdxlZwVTQz
	zqrEdvINsrvtR4ftUIPObvv0UKFfuddd28RlfdXbqz/ZBfwvc7c+N5815CsVJMRoeGIWr
X-Gm-Gg: AZFdTZelGS38uEw+VdUKLMwAD9SbCAM8gJhNv9/PckFEHZ4DsbbMhJdShxDRpNzBZvJ
	Eh3JOuinHein+j5mVEImkiqMgGRT/Wu6wXaHLp1mufiwhy6flqr3Cvz8wC8EBv8YzbCwJzetB7I
	uYOhGPNjvJ8cbW+A0vVi4ILTT5OW8FDHgHeeCjBk4rgazERDVfOKSdXCoLgmAB87jzprZmFHkLW
	en3o/6oIo4AHFv5DZ86hZ0eRPiEJqv1Rw5TzHeCQVOBPDlOFV8vpupELjmNDm3Jtc8IryEquDfL
	EViih8X0G+SLPLyhV6mJLXnbhm5L/5QGkLU2z2fx6lY3jjH/8cRyihgxZUXa2rvmODDHuuY7ufO
	cCV2dr8ROJlFcKmNhWrtkOumoFSDFCT4BgIv51cOkrIIv8lZ27Y8dY4UnX85gPQfn
X-Received: by 2002:a05:620a:7118:b0:93e:c12c:43ff with SMTP id af79cd13be357-949bac8120fmr2035596185a.76.1795461612409;
        Mon, 23 Nov 2026 11:20:12 -0800 (PST)
X-Received: by 2002:a05:620a:7118:b0:93e:c12c:43ff with SMTP id af79cd13be357-949bac8120fmr2035590185a.76.1795461611834;
        Mon, 23 Nov 2026 11:20:11 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680483sm24266082f8f.28.2026.11.23.11.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:20:11 -0800 (PST)
Date: Mon, 23 Nov 2026 21:20:10 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 4/4] clk: qcom: Consistently handle MSM8996 and
 SAR2130P
Message-ID: <4xim7ytjjuojqe2uznihksv3picq5ovfnibm3b5cvyht32goum@wnu6hpckeosp>
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
 <20261123-qcom-kconfig-unify-v2-4-fe56c8fd15bf@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-qcom-kconfig-unify-v2-4-fe56c8fd15bf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b0491ed cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kD_hoCCV8gRHnzEn8vMA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: QD59mIND1QeOkdAkhgdmDkL2ABECwJ2h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX5h9hzedz1HeI
 apWAnQrqiY7z3N/3UFjcgFRAo9GpklgoGV2h4wylwcc4GSjZbRkun0X2hCUH9y+pgfNbre4t6h2
 MMkln/uOgDHQl3tUKeCpKgo7FupjKpIeWsupy6yoT0PmBrnrmE1/bjxDFppS5+R4qboyR4EgZ8A
 Hb3wkGo2Vsj6OKIAybOGapxKeSnv54j20Oy03YP/MMuwtHnSCqnY8tqA83CnnifH/wsLcvXdt5K
 ZvvxvFlN405jgYECoYwRwqplUV83TFgbmlum8mNhn6KfkrWc63eF3UlyPZ/h0QKO72KdDPfI3z4
 eVB4uvcN4gFF1PsEv+em9e75WWQ0cck4NhXLM/sLOtDA0McaK06DqZyds4wIVJiMIussISsy8bx
 UAd5qKkukpsymtb/iygBP40O8tmCrSljDrkBrQsTryKo523wfIaTe7JXE5+8fhQ4OpD3bNTGrTT
 JE9KNVeiauvYKGWwscQ==
X-Proofpoint-GUID: QD59mIND1QeOkdAkhgdmDkL2ABECwJ2h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfXyFDMqKTrcwZ1
 QZfT0cce/7ul9hqoFrgJw1G/ECWzad7axmKxKTV4fjThZycRrmPi9uXDPrc1HWvYEDXPuaYbUpB
 Du9lNq6SA7YurSqT/WZ00ulFBVH9EL8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230076

On 26-11-23 08:38:14, Krzysztof Kozlowski wrote:
> Restrict Qualcomm SoC clock controller drivers to ARM64 in a consistent
> way with other critical drivers (pin controllers,
> interconnects):
> 
> 1. SAR2130P SoC has only ARM64 DTS user and other drivers are
>    already restricted to ARM64 only.
> 
> 2. MSM8996 APCC driver selects QCOM_KRYO_L2_ACCESSORS, which is
>    available only for ARM64, thus reasonably this platform won't be ever
>    used on ARM 32-bit builds.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Nice.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
