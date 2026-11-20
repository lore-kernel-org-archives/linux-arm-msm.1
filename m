Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176600;
	b=aYzG0OmYnGN9hKAfStQ0ys+nsgusvWCZeJjQX1ELlar2uMKTjFRK+Lriu/3Fu+q73PNu
	 HEOyMp7IKywCNG5VwOjbF3IqaFEtqz2AkkWw7syNo0G45x9OB36EPldxUzyBpRyzmqlKa
	 HJ3nDwngiTgx+37EtTgCPeq9xv/zwff0MCm9nH7EC5gl7LLwuXcEyVS41H9jvRYuu+tHl
	 JcVQ6JCw43Y23+NY96xvJHUT+Y5HrVIS47AjkFYR/PhxsfrRV5RwzBw/vGjAmp9z5PHW6
	 pm04zUsb/4UOCbjwg+hkID/Nnjn2Wp91Mdo5WnUbtCBz+rKxJ2/Kh9Fbt5c83G3J3bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176600;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NgFZenonLIOYrddnj7GBaw7dtDGJBTol3GdISdWN9zA=;
	b=URH+utV7poseKxITBjD2q9FPkG0cTaK3UfvgOtv1pkKi2Azhblffpzj5m9oWBn061Hfx
	 QRhNS+fMmO7RWtEhzwdTO0celpSsWb5u+oL5Pd6iJD5zdrsJMVktIp8Z9MvslKD2Wi8r9
	 U9sRsZ24Z+Dk94HHTeT2+LW+UWx7w6xN4oqwjKc12ivaRhyGmUkWOW+zumQBcn2TDvK6L
	 YjF00NStDvEwRnwUrYsFlZrhKzIiWkG2Z5nXq7AjnL1xqZpnhTpNvQ2aRJumlWqRR3toH
	 5ldGGEbRHV/GCbWkCyQD1Fctyx+IiHAWDNkrrIxpH0ESR6OxvGwNO8DP0oRRtn7GNNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UqHLWQpi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPrSDN0x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F13A606A326
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 12:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F13A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UqHLWQpi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPrSDN0x
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk8hn2155558
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 12:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NgFZenonLIOYrddnj7GBaw7d
	tDGJBTol3GdISdWN9zA=; b=UqHLWQpi1vKez1h/j4dKBd+k37dj9G2exi2kPZNR
	VGUaCftrWXxEer91rCfRSiJ+94Xnq6Qh7hdGQ8tIqDLpgmkcjB5NiAPU8AOY3eSN
	HJDcfDQhq8GE24Ao2/MKETS/+qQy0SQWXX2IqmCmk8HAXUculPOeX5u3yHJSOp2p
	xH4W2D/0oLjxNS/4HvX8Z1MynpO/FhomeVd05WS5c0b6MzsQ/wRO88wbkmjfErQ+
	/YTrL69kBb4hcZUPfeKNmjn5xiA/zm8PVLVazLIpDQW9rBYI1AyAIyfVZXtQqg6p
	MHfvuAV9vbZ6FwbdpnhcJ8drdzdBVBg7zGZc4oju3VDpWw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yhsqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 12:09:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso110561485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 04:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795176598; x=1795781398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NgFZenonLIOYrddnj7GBaw7dtDGJBTol3GdISdWN9zA=;
        b=JPrSDN0xE574o4MVMz74XqzX8BBzW94o0pcSq5sns6DvwJiVfhVybkatQum5RPgITR
         UmLzChvWYGI09dcBFHK2n2J2ZY8YfUFaDY4b9mFU6dDsDatCJsy/TzeG4T5BDUrPuk9k
         eaWPBEVzNwZb92OfTuBC17lzJU71yLGlbe0Ftpwj8kmJym3nRJ3LZO80M//jC5cpYA63
         x9c2n30X3uI+JBuBFuS77ybyYaYghK7EhLntijjZ8dr+qpuUIiiQKFxOwXlXhTDtTczf
         JlKhJRH2MukAJ7t/k0L/jpff/8MPZZq1zgktoOPRwsiFvBlZKAt6xhPpkLnYYgAJD6jt
         H5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795176598; x=1795781398;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgFZenonLIOYrddnj7GBaw7dtDGJBTol3GdISdWN9zA=;
        b=zFkZ0A7olhCNX+Cr7j9XeVe44lJE3S3tpvf4ipjeGPE6m5Z4ZucGMVXq4RgGfPY4du
         aWuqiopaPSqxQnoInMFX0pNtTsEC0qVCwqPyn7wWktUZDIHZ7nA7EZ2AA5c8N4tLbtRh
         inaYfCZmPDm/ZUUtO0427a8C6LaPO3gZ43M8Lt6T+Gw63mmjyk8DjNJ0MTkFpE30n/Cm
         RMfWj+3dOxuPwxM1i6qkbwGochakiYspWyMfrIZy9wGj8bMS42hVZPu2jpvvDsHFAKT7
         +oQ7WrwDeIDjLs4zD2LD5kJpTtcaU3AD70CLYoq7eHexY7sUemFL2GV8UTYTiJPs1iEi
         U41g==
X-Forwarded-Encrypted: i=1; AL+hErFsU62E0159u7QW40vbf1OUtKvlu+zJzaqaOEC9trOzlxCxrtBDwrMUKirgCEThhnSzXAcI+8IS92G0hyHX@vger.kernel.org
X-Gm-Message-State: APuU4Z9HAN+s0g2VxuetrLvhtLw5LNZwKuvf98xHiYf0rPEPK8zGSpkP
	GmtNvahQV/8YltJfjhDQVA0gtLb4yLg4M2wRi1ULNnCCNQsPL5zix5qQA1Db+l0JclmY7g4f7H9
	cm8eYRJ0Zb+Qw0Ne4pmzGQ9664m5eRosgbSM3V2y+lryGdBgPoj1gw02HVh/MxxAShOHh
X-Gm-Gg: AYBFou0dw4r1yeIleQuUqLEe2/hNghGM6NiiG27Ew8opXPReAvlUEGOyM3S3/hNMZhx
	e+uDlqZsiUk588OXjOj6hu3ebUkVCmf6tmPVPhr/8gaZ4bo0H4vhWvRPLPL0BI1zJIa/CeV6Aea
	adFpmQE4cYEDGJ3cnv9NZPmb4G4gvFCajvFgDml6ltxEIkH5gmOPji8/KQUiryeqgwIRY1pVCo0
	XEroUBAlSb4EtK4cpilu6BQsNbGe168n1vnzqRlDObAwu4+lrTSH9ij0LEcJbngVjwWY5bZIx4X
	642pu73LE8aH01S3lJ+M+PY2ze5DmEdphvy+8XSKjL8eW750I1k2JR0f0qhYS6lfLvS3TPVc5XS
	j1MWRSnOlZW+gdifHuFC7zFic6a8WUYxjrFmbeSsiqSfFvfcRB7h3ejxe1p3ZBgG8
X-Received: by 2002:a05:620a:199e:b0:947:82db:2f9d with SMTP id af79cd13be357-949ba7e18fdmr433988885a.2.1795176597547;
        Fri, 20 Nov 2026 04:09:57 -0800 (PST)
X-Received: by 2002:a05:620a:199e:b0:947:82db:2f9d with SMTP id af79cd13be357-949ba7e18fdmr433983685a.2.1795176596918;
        Fri, 20 Nov 2026 04:09:56 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb4341sm5645885f8f.4.2026.11.20.04.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:09:56 -0800 (PST)
Date: Fri, 20 Nov 2026 14:09:54 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
Message-ID: <pjcdhrc7b3gs3ll5ml3d3ohnuivtc4rcotnhnx32rydc7htmfm@y37lvdnugj35>
References: <20261120-shikra_qce_fix-v4-0-5249e31394ce@oss.qualcomm.com>
 <20261120-shikra_qce_fix-v4-2-5249e31394ce@oss.qualcomm.com>
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
In-Reply-To: <20261120-shikra_qce_fix-v4-2-5249e31394ce@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b003896 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=l6_oCbVy_dZ6_alwpPcA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0OCBTYWx0ZWRfX45/4rKxGSFlU
 hjrhzHgCqFlVgZnueQwb8kmRiFhJZ5cAOAAfQp5Q/kNiEbtXk4G+MEMAjLL2jb8TdgXqpb7JKmA
 J4LUSSYWnSpZFranbBpY25LNoGhc4GM3mWIvW/7ZP9t/RfvQes3Nez9YzSA7GMmNGzGroMl6NBo
 7ycA9+p5DzYcziryCpKiPQSikrRhGXo7afyfBkeUw8yTIHgiZVTG6+49Oie7Irsvt5iM1jiwjXX
 Upsr1Q6e+r6nK8MNeaVCjACVIHseguaTL7/ADJEydGRAAwHpHIuhE7KjjN2N0xx5ExtCilLsnDQ
 qembuBNqBp7RIVh+ltiYiMQLF2wq6Jdpbvs3lc55Q3bh43nrLubP6D/wJAZEFjK2i3rtU2n0mI8
 9H6F4A+lx8QgYOXIDChkyxdhjUBom2SZUc0Z/94AM966KGs1VmW1GfJ0AQwZhcTm0sMMRWX9/Cu
 RvRaL+jf53Q0MqJDkJg==
X-Proofpoint-GUID: nrzcO2QMRjC3x72_iAJGjuZKqOlprcxp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0OCBTYWx0ZWRfX1axiD+YMmbcN
 1toPGnBlQB4L2bRp0sYany0maYN65lBcjUFOCcpj0yVSbldZJM90I7QaI3+CUqqdva1vSrXtGbf
 qco7clPqbDatr4kUk9ShvMz1rdYiy1w=
X-Proofpoint-ORIG-GUID: nrzcO2QMRjC3x72_iAJGjuZKqOlprcxp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200048

On 26-11-20 16:59:53, Kuldeep Singh wrote:
> Shikra QCE requires an explicit core clock, which is missing from the
> current configuration. Adjust fallback compatible to "qcom,ipq4019-qce"
> and specify core clock to match updated binding description.
> 
> Cryptobam is controlled remotely and its clocks are therefore managed by
> remote crypto subsystem.
> 
> Fixes: 099cd05d200b ("arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes")
> Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com> #on shikra device
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
