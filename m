Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1717397922
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371868; cv=none; b=Q/xQLS1UUvQVdoE9sweMYsULQKSF6CJ/xbviK1pslrt7QDnN+bypb7K4OJR+zeRnGBX+Ea9vnJysfwPHpXKrIG4DqSUuZccszBNuFHDDwdmLpQAewWtPcZTAJo/kSXyd7iYHSw/SvmfX4otWpBEFb79M2GhdqznuZDOYYC57RMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371868; c=relaxed/simple;
	bh=P9FxzeMC6lbyENHI8BdJ3yY++OGFptNNDYQD1C5o638=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvseaODb0uHYWOPD0yCxXi5RIH4yvaw1ZIjPdyZcZz00M/S8+TMYQAgBbqy9UMJEWf1j3LZFui6B0agdxXU9uC99QbSEi7pD3zRIQfKaHJ04byvS+FedjcftURnTX1GjCmvLjuPtKngpiyeF4PoTI72TZvP4leoWcJlQ3d3Tr50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QXzl8vGB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AgA+W1lF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QXzl8vGB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AgA+W1lF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ilAr3369254
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/cd802JdT+cCUorD0ME29Cwq
	TidSfnnaAlDvsoD0fbI=; b=QXzl8vGBcHmkbbmUXMpi7SIbtHg4v/l6nT7W4W+V
	EmfD18zYCeTAJbwWtad1b//eZVbqw0d7cxNJlX/xAW+Y2nST21r3memjpHQT/igF
	R33OYAhQcGBdBVFctBG660Z/5iRSYWQvKl/OH4kv7xTsRK16+31QtfpFpmwSRQpW
	lsh8UDhuw0CgpUto7jH8zW80m1nZ9XsE26asmsaksdx+wcjZfmIZVpj8AfBEcWYQ
	Mo7Ox0oMLipsNRyexFKg2XsJOEdqiKvg/Ihx4cBPT8e7fjPnPdxwD13SpBM1p9Yt
	5AogGcugiXnbdPOpuBCkzd4cTDqyt2l1jypQK/RqBfkZ2w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5kd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:44:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a183a0e93so161724485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371865; x=1789976665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/cd802JdT+cCUorD0ME29CwqTidSfnnaAlDvsoD0fbI=;
        b=AgA+W1lFglp0klND7jYuWJhzy/p8ytc5o1kKct8ZO4wrGurmbj2POQbgLWoE2ewLwb
         LoVPmeb2aLxYrW15KpHVgA0kshltelrW2EGq/q8hxBRcmF+FCOwUIL8fMA663m+mJkuz
         KEZX2ID2gu9huJSlIBsS70ltfGmbGbY0aT17GiqPIVvk3NHVZ2gRZ9Ygz6JZ92HEvQN1
         u/PDvno9tpbrPixzg63/lszpry/xoXEmvMhFf/9lRt+7T2ueNsd99GDg3V3ax3akYGeG
         W7BR04dH+RElESaE9vYC3juKt2kCBXNn6Fq/steAbjugqPvCDHWEZ8PyG39OW8PcSb/G
         6Fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371865; x=1789976665;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/cd802JdT+cCUorD0ME29CwqTidSfnnaAlDvsoD0fbI=;
        b=IqFVotAXXMZumQRXsfGvl4IYLZQQcZL1z8QkK6+nxPWKzHbSMY7AG8Sxq3hEoKN7Wr
         F53CxpQN6/J78zN45HW3+mnDy77n2eD6UpodfLzN7g6KhAgVaQ4V7rgx6sIFKmoS3zbX
         z2fjCHbRw5DICcXX1l4Xd0A8VVcQMejR0xZIawMotDC3RwJHSrewlX+Ull6scM96RyXt
         o/s6klMY3K3eQZ9tBTlbooil+IqzGHHoiV6+WiQ9M5ajHCpHnnO54oz3rp7DHXn1d1tN
         YvoEg/OCxb9Q15C0XrkiG6eBxTENa43Kb6nTFrHJzplRT4rfvL0K4QOMTOkR6T+tcLlC
         55Vg==
X-Forwarded-Encrypted: i=1; AKwUvBx1oe8U5xCj0Re1lOE80TTZQ189S5PoN3uQwV8fiHy5gG0MUDpuRuKH6gCyWPL+1vss+4U8FhYwD06Z6fQX@vger.kernel.org
X-Gm-Message-State: AFuF++mlCZcy7wpphGyEQFdyh3Q6nzBUiIzy6RK6aD7ZSyPMwDr7E2Z+
	zS/ROPCURBTSFJvbUj+Fplzxfs0LHuINxulwNIdYt4k9SAPRrkyGA1X4fGqXSRCl4bx3cSzBSNf
	BiCl4wW8QRhcQr9ZyZa9j3tlAA0WxF5NQPKIUQLY4LU53reuh6jtLbjWJ7XBKcMhn1RJ5
X-Gm-Gg: AYBFou2MXHIAp3Iub5EHPlvRy717naZnJr0QmHFf1CGJJnC+IM+92Fj7NH8Q1XnH+70
	02tnzfOR94/R/sX2Of5s9vbj0fdSRaOhOFDudg+gJkCBhMLPKXR5FsJajjmFONQ/P3WoA+jVU9P
	osJnWn06KR6s6fmbtsARaAMcsqLVJplVuFxJiK45C7Q5BezMNm9rZDkZL8BNXcWKqnyyg9BdxBi
	BtiP28t0MjGP7YtnCm/ehvik34s0jV/nKsBlzIKY2F6vUxUVV2XoOHLogffWpyeGhh8l0ynNXI5
	a55fALPZwTh5R7QLZ035oUDWQkQozDA83cRvDSsYej0yUgMf7R00i+jPSeC9UuoL3PGSgImYXPx
	MP81qcRqt3w8bLwk=
X-Received: by 2002:a05:620a:3185:b0:939:4b0a:f0fe with SMTP id af79cd13be357-93a2977bc24mr195766585a.14.1789371864698;
        Mon, 14 Sep 2026 00:44:24 -0700 (PDT)
X-Received: by 2002:a05:620a:3185:b0:939:4b0a:f0fe with SMTP id af79cd13be357-93a2977bc24mr195763685a.14.1789371864202;
        Mon, 14 Sep 2026 00:44:24 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bed0sm25573045f8f.32.2026.09.14.00.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:44:23 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:44:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 31/31] arm64: dts: qcom: sc7280: Add domain idle state
 names
Message-ID: <yf3lksc6cztulduwnl3bpw3p2gto5wk3iwmvdvpovsr2ry2wm6@wxqotyf6vx6f>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-31-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-31-660c31187819@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7a5d9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfXzDaME2GqJX5Y
 F2AQU3vWPAEEqGxIDaLbSj/cIMknPI4Sd7eNduTkqGVwmbkjcEwAA/tTT8aLTrtKteUO3t3dboR
 ScW/JceY7kmJiREq3/HGXTt0Ahw1tyLClzcZP2mMtkbqAclWbbcxvAaqv8QXsJ2k9Yo1W2upGrP
 8VoVggQZPVQo8HFFIsGIwTcA73MYBfm46DlRySWa4zesmoz4ajtujERViVUcouP6xK5TOTIiZQS
 uvxFLqAYKklzDyMmokPpNCvAaGqf8+3e2NxwZa4poQYMZ427vzI+rfFToqaPrioRVRqckb0qGiC
 gEqn8G+VbD43jQY7bl0vqWG2TFQ8njhgsasviv8Uo0op/4Z3yUepSW6c0fweLMNVYg81SkFwh+0
 yScnfJWL/95CBV6O1yOsHDYZgPmTBEq44ekrAjQfwL46uGo2Odyp4HuByDpPR6u+Y3txjfr12wT
 ITpOCmGHVQBoJbrUsBw==
X-Proofpoint-ORIG-GUID: 38ECCQXgTzCjxVAAXaPWxhmerUxWi0aD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX8jvfwod84zp6
 0p+YTe+ldF6E98mwiHPOSQhRjWgtFL7yLerBeL7TW3U+OFMyupCi4Z6OAbA4kBPIKbhtNHiAGv4
 bJdWXGgaaCChC4/Ku+1jHTN0wGKuvWA=
X-Proofpoint-GUID: 38ECCQXgTzCjxVAAXaPWxhmerUxWi0aD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140109

On 26-09-14 12:30:03, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
