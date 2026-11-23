Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462896;
	b=LDJSj+5dDRTu9kOE85yEbD5kMSOIlg49Nyrosa0dqSSUsx7LOydZ9k37SHThqncHztqS
	 9IqrOuT11zJHZwnTgFpKCA+uHqEpxEdtzHnSGEKNez+3gZE0XPKsM53mYnNfCoI9vJU83
	 FyspwvmbC2JLPF/2hzyoz5Eeopeh3F7vdwA2z8BW5mo2FbDzw7oIhCTwyHsW1860LjgBx
	 Ml/kEg96ULXZIM2AVeNMpsanCAqYDxPqeEQXqxPOPHPIG9qgVIEoS7NzNnJvmdfdtxkwj
	 wXbG1vDJNzsoU2QKMT0e40eL1DvpjKxz+8U6n0rTE6MErq9V0SbeHXkvFHs7O7Zbr8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462896;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iWoAxW0ABYsS0zE9hrZD0wqatrqG4QOz/0q/ZQLBBik=;
	b=5Z9Ch1+7+w5bOVB9u8xFEqylupeUaRooE+SRzhBVezfd4ne9FJpJo8YH9yLbIeglTyb7
	 KVZUYbCZFo9WWEYbVEsj9k/xUAPPdIq4wYFwjaCq8LwFojWjVK4uT7vCvmZ5E77nXlD6R
	 IjgHAHUviB9twF30879axWfXFl9V3ekdCaeKsKpI1Hluq4Lt4n8panGRJnhtT58GuHIvr
	 SlWUaGNfdzF0/gxhGVbByxFURL2vWlanDP8c7mjl2Biae9Wp0bxJ3j+U/USdteSWWjgLF
	 hJ8zDpyEtSymxpSlvZN3mx/6KBmRxvsLQlkrasD30x2q0rAU+kZ27WmVOXO7B5UZpdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jWmHI/tX";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QTDH6QgW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE346606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE346606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jWmHI/tX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QTDH6QgW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3vM1093799
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iWoAxW0ABYsS0zE9hrZD0wqa
	trqG4QOz/0q/ZQLBBik=; b=jWmHI/tXXYpGKgSop4Rgj1A2WikJEh7R2Zxyde6T
	0t9hhhftHUgi+qC6ulIhceR7XS6XkcMFifkOgZCVCu4jylzs74pybTY6K911PAXm
	k2DqlshdqwQZ8xoA3Wsra6zHhFZ6HExXgaCIKf7k84P7K0MWtU6R+NaTllVBPIhe
	aaDqmnwc1NV7AE5jzRv8/JKKRi3T61wBO9/pFDpJsmPZzPFN6EYJKqFnpSHaVF6/
	AU5FigJDqdkjY6NR6P+5NP9q6VjJHXSRiFcEvH7UEcyM54/sOkoiE5vdxO8amup/
	1H9Y8ANMNaZVklcQ4Ik6ReDEaSYt8Xhr8dsLsOYKsHdPbw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0t2wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:41:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94960bd17b5so614824385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462894; x=1796067694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iWoAxW0ABYsS0zE9hrZD0wqatrqG4QOz/0q/ZQLBBik=;
        b=QTDH6QgW4De0DHMryY0EH952Dx0qjdZBROc0HEeg8KKvi1sljEJ3IQmQuJtJtEpoVb
         Gx1jCi1NkQ6cST34Q24zLrfopjPT8XahTaYehTLP6l2+K4gw13J4uu+h0U0r9X5QDY0g
         dS4Estv0yYD9hjMWAY+ZKsvhTCvkQpJOVRSC4Jzy8raFOk+YUV9IbaHccI07miSPFzlE
         eODOfzVs1Egt0CM4a6TUxtlRWzquFf+A/Yc8La3o63MvVBN4nDt0LD/4EXxJDryLHirw
         aPlPjZi5noG8nb66h1ogtBc+EDFU/DVreEKhbUTMe+KtuRQHn75o1962/aPmy8xk35mK
         Hz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462894; x=1796067694;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iWoAxW0ABYsS0zE9hrZD0wqatrqG4QOz/0q/ZQLBBik=;
        b=C+GqoJIUyiTzJA5GAaoTg+2rJiTyOrcncE2o49JwzWKim9OJbZxw0EyiiO77h/6je0
         bd5ODfbIgnwZ6SZz8uTYgMadgD8JwrB3D7lm77wdAO12xlVtt4f4pi9+teket/xsJ62E
         kJQGGDsCDXM72OCjFquuXPypBOoeSnBherpUI+A2vkQ8o2oGFnbP1YPPgzVsW5h7o1oj
         gWTIPPrrcNtkv/CEMlKSIg08+u24K2t2nkKFxiNEepFx1pOtLTy3YzFVN4dpU3HwzQRw
         ytE9XmPLqsbFH/Uf8lo7NbIg4rV5TymR3k8Ym94THkakkIjvEn7j5v/IyLDnoC13OIOz
         44Fg==
X-Forwarded-Encrypted: i=1; AL+hErGZMXJgUgsid25Dn6qvzlzaZC813jn0X426ZtsB3QFBBePoZc21A+Nl5j7ZrrygUR2u5gjPeJbup4W+zKtA@vger.kernel.org
X-Gm-Message-State: APuU4Z95qjIVORm6Ro8P79d16YVrAZQhDvsK4rK8YSxoaYqbs5VGtA09
	jWaAKbxbM6lU7nCdjxZWgYSv4KpdFn3QNCCQtJZoyFdF+pVI56tDUyPh20B2u8YSYUrJ5j+H/Cr
	TA/i6OwVxBXfrdOqBmvoUlgGAThyDRHFUqWCyLLXy7Ihsuxdm6GdZ9G7+NMa9/r2BBitx
X-Gm-Gg: AZFdTZem+0ZbJkDgy2EzoCzcGbIa+/cBZ8t/+LCqnWfRSytYt6SYequMIe78IDFwxaj
	F5p5nHYKvCTK+GHXXmGzWV5xRPP5VRb7d0q5Ush+S5lKEwQRtVvz0dPgKwc7Ee0ugzFb5BfTGFf
	VTEBm/S1th54OAvqwAyrX9XnxhucC2ErlcvO6WiFIuCeliklxQDN+sVYje44Y3ug+WH++/UmkTa
	ZCJrPXfWQlAFlxZ5/Cyi06oKwKIN+TpB8k6QPqPXj1PQ26fsnT3xUOUgdmVX3cNtwgih8WpnBwP
	PcfbZvZEFu9+rNBoeCOu457EGun2bwwSecMejLeNKv0Lj4tJ8PNmdJvw6RO6jAttB8UPxVhsGY8
	GKc0keJSaWy7bZDJ3vdv4vHAEsiXHtLK5S/ZafMq2l7J8ialE6/fqjxgGDJDeSL4s
X-Received: by 2002:a05:620a:6f0d:b0:939:6dea:374d with SMTP id af79cd13be357-949ba9d1fa6mr2093265785a.49.1795462894039;
        Mon, 23 Nov 2026 11:41:34 -0800 (PST)
X-Received: by 2002:a05:620a:6f0d:b0:939:6dea:374d with SMTP id af79cd13be357-949ba9d1fa6mr2093260485a.49.1795462893448;
        Mon, 23 Nov 2026 11:41:33 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f1b2sm22227959f8f.25.2026.11.23.11.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:32 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:30 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 14/20] arm64: dts: qcom: sm8650: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <tll35ljrujo7sgz6fesshor7idu7ujoyhh76crbe6xajc2sar3@6uvambereae7>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-14-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-14-be30526391d9@oss.qualcomm.com>
X-Proofpoint-GUID: aIDFg6b-Cr1gvozhGP8Gn9D323QQSrdR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXwQRu92SbX4f2
 JPv3dfOUTNovgua6N+CgPhrY+9uUNcSg4+c+CCxgUbs9gNP5opw7y16GDJk1saCeClZVXxyrWjs
 vfKUdlmHWWktlxzqH70hN6tc97E70Nc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXz+ZLFWVhf78w
 72sNueepVy9iTi1USB/Iq9DIGAyoki3Spsr2qmTK4aRIbDBvUX9ujjG73OQFE4CggaU2Y7lk9+q
 sK204XTjx+Tv2V4ZkC/hb7m99lSBW1vOBueWF3Kt3q11j5KsDGnttxDnDTcAiuycibYtqupf0wF
 IfEGDjjFxmHjArIGfQH6jvPZ7oeSWhHAWw2DmedbBldQjk2wAWO4rFedSN9CAC2sQ4xR6EnYAfP
 0/3pOItEULtKJV44jc92DqtdI30m5ejvQ3wBPWJl6bSETZKgZePjGngz0Z2BgAS6X3+XeKub2Je
 PH1gaT9PCBZIUYZ2E2/d8xKin+XOrJ/ZTuLKXS2mSpG+DdAICx0chPsYF6VzeKcU3nwKgmE9kmd
 JohVLfjuAT7+WoMG6d9SmI2/wYtnb5HnlL/PNsKpS4VaL8KnRp9XBxb2vkaD/nIZTj5+AJiPDlf
 2wu8WN1imEfnG61WXiA==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b0496ef cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mDVvi5Pd1DWatKlo6wUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: aIDFg6b-Cr1gvozhGP8Gn9D323QQSrdR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:45, Bibek Kumar Patro wrote:
> On SM8650 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
