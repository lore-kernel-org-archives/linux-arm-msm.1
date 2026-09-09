Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A979545D97
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 11:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953662; cv=none; b=FzG6AK+iqnxLkrNIciMSYn5JNNzk832OTBc/7oSPazRMmtNiUr5l52qZOMtGak9CpXa7sfebmMY8sWPUb9ckLxwnJFX5UBw2XybOaUY/BJ4GcX5GRcFrd8wpn8uBX5VgyYoDMdwnck4G9mw+iOpqbo6/bHyGhDBv+gYk7yey+84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953662; c=relaxed/simple;
	bh=gBHBZjUolX3ivaVZcN/dbcES/2LmlGtAFF2GWiOv9zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euUZteBjSvmmBcBX0hnk/ZuO6PESO3DKc0+i7BeL3KgIMn8toH4ffurui9OGpRsYtkdn8WApea6Bm49bLjpnzbadkzFgbw3VmA/URw/Zv9NOdFZa+rBTlM7zrDW/HJhVJwRuZF6A7WHIYq4i9dCgOWErVx5AM2NCQ7gaxr/wotk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHsylMHB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWelVWCB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kHsylMHB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWelVWCB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUgsG2173678
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 11:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VkFNie0npr3o0gEEDYtkg+VD
	BnFIkHEk4uIug4kbZDI=; b=kHsylMHBdmve31tkrzie5pyECzo0GZjJ6Vo2xsuD
	yZlVXRUEhWj+ZcorFC9P/zz8x5kKb/AazOEZr47smD5RtlMItDp/D1mmuzuoaaBf
	kU0x0ktd/I2seoUI4HwkrgR9zVAQYa/C2wklwxmwTtbSEukzdCGE+gwn2bXvdN2D
	ck1ZGKc2IdfhPwnP1aKmyK+DDqAgJR8AQUmnLq1HdJHdff0RfH06uaU5VwdwE+1Y
	T+jZTxMBiUvsE7wy1tELhXAr+3Ksr0TjPViSxiR4iJpNxm5FnsojufBJsLYw9R7E
	XhgeQxIDnBPkfdxHoNluav0fyj+Syl+b9HRaoYg+mJzsdg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5rgg7hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:34:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b90cc0d5cso3090905a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 04:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788953657; x=1789558457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VkFNie0npr3o0gEEDYtkg+VDBnFIkHEk4uIug4kbZDI=;
        b=aWelVWCByOEoSBuA4ylrQ0KkikreqSfSFsNyQ4nUy6sQgqizhQwrBdW4BG+hl0hu0h
         g/Eg2xBqEGr3FeUSHHsRQCGkHjgs9+jfs7JvYchlFsZcabPL97FfLujLrHJEK8TBa+B5
         ttcdclvpsWfYsw2PgcdQ+CL1gPMtLSLhUujd0V43IwDcY9YPC4gdWXFp38NFH6Yj1RQq
         SLVFpXPhz+cWjfP2Sdcq0AS/izqPo9hHSAe9z4apqRiYi6BuU+opGge1JqevR2paTnBV
         fKYIaFRaKh2DfjnGzd33Tb3d5FziCbtSBztLVUVHHW6sjwEkwfDM/wStvziXYIemWL2m
         l4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953657; x=1789558457;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkFNie0npr3o0gEEDYtkg+VDBnFIkHEk4uIug4kbZDI=;
        b=g6q175+HnzpDcS89fM98TNVf9c4XfhY7duGaC4BaeMVqG5Kii8t7u9mfhOUm9Ilk3w
         aEcwHRGaZe0SvUqA+JchQoKER+lyl0t51+q9dK0MyAas8AN4PtFmCIJmcTuixj4GyaV/
         7/73BEAQZjPBEKIRDROGJ8mhsjzdF5ZJtuGXUBcdtcFQCOcW16+S4KXgPzZnLRqApcvt
         QGsiYpkpP6VLQG88VcRYWGuhTUyBuK+rZm32xCekXy2UAbKY2P70sdqL5g1KgxXe0H8B
         wZNnyR+0CSEAYlGHjD44aps48LZCB0pysrl1LBHY3wOb5xFkLQOiUEkyWsdjy1lMpvpj
         Ym/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxl6K/P0WjVmanj9gdjYzy86w+ORrW7tJdy9Y4I/irwFJNh3g/QHQqvYNwS4zHC3HvebZuNkVjzKk4h5fbo@vger.kernel.org
X-Gm-Message-State: AFuF++lBJB+gQ1tbXWyl3+rc/f8T4nvqgsNbMFS+DXxI8R5hCTeyK5yZ
	OuVIMn6xevmNlyfWdWkfWOPHiJKd4xJrLSo8eqRaiyktcDF3Y0ejxQB5iGIpwERw5c4S5KwUeIB
	+rCTplUukLOnYcNbdz3E4ygEonBcpEPjCUVayGnEQUI2NSx9kZj1GghcOMcAvmIFed8zz
X-Gm-Gg: AYBFou2orVZZjT4JwyyBRbdifTaiPsxCgZci9P9xSpvBxHm08+i119eG0NgRsuMZ39j
	5h7caH8ROkvr/Fc3pWZeWhYtRlURiOdIZRhivHvNYCd9BN4kN6Ktlgs+MtSL6hjpyWW+S7ie6AE
	Uf6n3ucccN2k8UltE1ExiG6ECEu13NjwxWyp04J4DHIpZC9qR9qkGaORNUnhtIujSrA8OCk3TXV
	Fu6Yx5uZg7yGb3NVzFfQ4waRLv/YGElX1W6JJgaqlQvkyU6opgEYhxc+ZhZOfH2GC/BDa1bFDbZ
	kzE3EKpKVYEmvj0EncdzgGmvURqK5ybFkf8y+k8AYpXNF9Cw9oQ0mhcxLhNMReoyT9eaow3lect
	UIBRGCYVX39Jd7A==
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr53996886a91.9.1788953657097;
        Wed, 09 Sep 2026 04:34:17 -0700 (PDT)
X-Received: by 2002:a17:90b:54c3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39b2612ecebmr53996780a91.9.1788953656466;
        Wed, 09 Sep 2026 04:34:16 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-339770f0489sm12225302eec.8.2026.09.09.04.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:34:16 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:04:09 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH PRELIMINARY 1/5] arm64: dts: qcom: shikra-iqs-som: fix
 GPIO138 reservation
Message-ID: <aqFEMWZOjK/DyeII@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-1-69c0c5c7c124@oss.qualcomm.com>
 <4aee70eb-bd1d-4320-8921-e55bb8e0d176@kernel.org>
 <98602703-4a1c-4e91-b7bf-934bb9894eb7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98602703-4a1c-4e91-b7bf-934bb9894eb7@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyOCBTYWx0ZWRfX6cACXtY0xOzy
 EVE0CVdXBCo4XuZzMTpbEcOqr8sKJQZ1NFeDBYejEng8DOf2s3aPY9sGpjsl9h6RI/TJ2s5qKzU
 f3qqXX2Dq08zALhtlW/yG77DYlohjCs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyOCBTYWx0ZWRfX2Po5M5pixXk+
 jCbtuVNWaqy8XXXujU6hTLD456NZ859xm129Onbc97jLMy3Ih+XD1Xx1aTK5oJWvAZKc36jKiyw
 6q9Q5t3CZGLzoLPFHv/69isu50McxrQedbGfzGAzx7tVhh8KyjEQ8mGX5CL2+2I+k4+JLxhQKCe
 oNpQaar6o1FzckjYrrtC6ocJNiW1OW5Cx7NOdPJ6vWtmmhezZ49W4IVTF3wh0yME5xR8xVXJxPb
 ZF9LNnXfEuKhcl686fCMjXHFAOUfvJFsbUXYDZOaMLGuih5XQpfC0+5t13vvFugn6zignMBpyXi
 c5zRoDInp0+HARMgfLASeCn3JSuS0OrC9iFfJQyH1fUpkKasjljVOa9J/jjM1hqW2gtLA4CPyx/
 pzVge+DOi0Zjk5tJcjlpXhLwbRTUEIqOYmJ5tWpOZ5dnQETCJT0laP5plOZVLBixpw2z+DNH93/
 8Lq1HM6jf7GxtnrfKPg==
X-Authority-Analysis: v=2.4 cv=B6qJFutM c=1 sm=1 tr=0 ts=6aa1443a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sXEucBwicj8mESCGqQQA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: VzaIPXUcNFuTIwTQXaOAeW73FU5nOpIW
X-Proofpoint-ORIG-GUID: VzaIPXUcNFuTIwTQXaOAeW73FU5nOpIW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090128

On Wed, Sep 09, 2026 at 01:30:04PM +0200, Krzysztof Kozlowski wrote:
> On 09/09/2026 13:24, Krzysztof Kozlowski wrote:
> > On 08/09/2026 08:23, Mohd Ayaan Anwar wrote:
> >> The GPIO mappings on the IQS variant differ from the CQ variants.
> >> GPIO138 is connected to the RGMII1_RX_CTL pin rather than the NFC ESE
> >> Secure IO pin; the latter is connected to GPIO49. This incorrect
> >> reservation causes the probe of the second Ethernet port to fail:
> >>
> >>   shikra-tlmm 500000.pinctrl: error -EINVAL: pin-138 (5d20000.ethernet)
> >>   shikra-tlmm 500000.pinctrl: error -EINVAL: could not request pin 138
> >>   (GPIO_138) from group gpio138 on device 500000.pinctrl
> >>   qcom-ethqos 5d20000.ethernet: Error applying setting, reverse things back
> 
> 
> Apply this patch and reproduce it. Is is possible? Didn't we talk about
> this already?
> 
> >>
> >> Replace gpio138 with gpio49 in the reserved list.
> >>
> >> Fixes: 779aead2dace ("arm64: dts: qcom: shikra: Add gpio-reserved-ranges to tlmm")
> >> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> > 
> > This looks duplicating:
> > https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> > 
> 
> Ah, no, mixed patches. Duplication is between other works:
> https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/
> https://lore.kernel.org/all/20260826-shikra-dtpm-v4-1-8476223184de@oss.qualcomm.com/
> 
> But nevertheless I am sure we talked about this, that commit msg and is
> not accurate... Cannot find the thread, though...
> 

Yes, I'll reword the commit message so it reads as a prerequisite for
enabling Ethernet rather than implying a current break. Also, the Fixes:
needs to be dropped as mentioned by Andrew.


	Ayaan
