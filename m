Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201254;
	b=XK3KxiN+HqeAdHB98IXWc192Hu17L5Ai7MtguQw9ctfNNE5bG/mQwcf+XPkGZ1MjEDSJ
	 QN/71Vx42sIJ8HDzFiZULnzonhq/59xktNuO9YjMIW+FdbkpY+huAz8aPcBuu+oQbQW3a
	 gAi7RqJe2EaVZ88mVz+QdaKQ4nTrmbuaQYuCkEAc6KAaepsSrZEFeZQcx7Mz+P1/vHx+F
	 R9v13S49hcvgaXTbzalief404uLN4BHxdc3IcNCd7abUOZagRsXI3RROCtpkYcUSqi1J3
	 4qwNyGdaEGscExcf40ZaBYPvX1KpIj2zXwpdNyt895dcKbAZvuNKTi14E86MNP7rPww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201254;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SgVHroHe26mmsC3+gKDh7oohcL6PcbX2BsXPMljkV+w=;
	b=z35X/vtNKglOOLBzGMfE4NMKs8WKEcZ2c9nWRa3Wb/uUh1VbLlih/s9bOZzaw+xxiNQC
	 xQXxEW+El8Cq4AC8LmpuM2iYtJN3NrJkD8OCWr/clV71cvzbQ9jsDStdQdvkBNR5gAkVF
	 4KNGtmNQXK2ZRkR7H+F+yUR2bS0uylwg3sVdFNj+ToORFOf/TIfSU6Y4pt/msG2HAgHRy
	 6Ed1NqwVZnBRx01gNIhiLl+6QEAUmJnapNgHyRkAcJst5pmDG/ys3FAFCpNOZT+x9cWpJ
	 1l83exRUkVGwTwUfTbF9OwSetH5Ycw2HBlsCGb/15bbXtbLCnLnK+EXduR0giNsL1JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QWa4aQLQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Wp6/APDX";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BCA606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31BCA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QWa4aQLQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wp6/APDX
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAcZj423495
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SgVHroHe26mmsC3+gKDh7ooh
	cL6PcbX2BsXPMljkV+w=; b=QWa4aQLQJ7t5Qu7+L+ovdgFII6i0DkdBnE8jX0jc
	EKTkBHl1iYmWClp38auy4HjJDN6ANj+baTwqQ//2CFwIEoHRqqVccJfShmhep7ho
	7xnRs5xyXLW9Y3oyYa6lYBVETCEBqNT/kwqV8yvh50pKrsL4XeyocCmaYRkAzObr
	Gq7wuhDAgW/a8Ss8zaoSoyVk+44duNUyY8+GRtbpoFDXFUSpkY0UtoPkKzi77Dvu
	XCFkhj6vdHA4lWYM0toq32Hv+FY9riEz+LODeH60Xd/7dD/cB7oeBKJkvMEDrqZx
	x/K5ED145SAULBltjUxVfsj0ApyBJ+6RzXj8YBT71VDPzQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp1j0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:27:32 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc694cb4adso176055137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201251; x=1793806051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SgVHroHe26mmsC3+gKDh7oohcL6PcbX2BsXPMljkV+w=;
        b=Wp6/APDXa0RqemUiErRdA90IyeB+vElS3ja/vmjbFHEnKEoFmsOE8qkyeaxfS5P6If
         B85CYKFaeGJPYa82OSUHx3i7shf9/uDTejfq+XkkGCo470XNqZtF7FKmWPyYqWjMDpv+
         F4SOtKrGNgQi8IHps/+LRYunPovg95uygIg2D/TbkK5i6n9bDcz/bTbFP5Fxj10HxpmI
         6oabE3y9AbuYVHcXohvXECm7XkjaL5PsDYtHfWaXoV/NopxCKtZtFQnCwUU6DZS7VEbe
         OTYesey0zVw5UiIMdBTPKnroWMKadG/Fi11mCxsxifhbR17uhgWM19pBm9A3yPEkUI5t
         nYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201251; x=1793806051;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SgVHroHe26mmsC3+gKDh7oohcL6PcbX2BsXPMljkV+w=;
        b=p0u72l5kbeBb2e3nM2+x/5S5mFNo8sEPvzt+N6yiPO5S2Ypj578Tmxt1rX7oaeEv8w
         AqZoal8T8BDMfo6TYZ1QV2KIhZB0JJW7miXCBUT8vAKtITuV1kuE15ABSkrLrIvatshP
         WvJgn755qWt37q3smhtcw3Fy1ujmd8Ks0pKEQpBjzH2iTQDHLbVrIKbr+9ChLCtuczQM
         ClQ/rK1rJnVbDliIdvgWoG2sJBeAT9BazqIie6ZTYW5BcNcF5zVwIjQBZ26qnkAMmt/l
         x+OM5WClxH5pP70LYt8Ie65uxDFfY/D/Z6FfmQPz77OshIaG8/F7hR+ZLxkISGJRt5cK
         2G/w==
X-Forwarded-Encrypted: i=1; AKwUvBzqNfZpuW6viafwx03cwFMI92r50rh+qgzQw7PlZWdPWMpWau1Wlj3nbWmv72Ym4CQx/4qWQ4ogPY8fOKle@vger.kernel.org
X-Gm-Message-State: AFq9FYLc8Iwc3kInNdGF5uAHXu8/oTTbcWZ9GsyztrTWn5KwsOXwZXFI
	6gsdtO2bquJ+1t85Xh4RWUQDVdFBf7TT2yxM6Cc4yyClQqJ+EgRT4EbUwt7Fx5PfBJb1bs9tJV3
	qj2H/pQsSBfFG2AdlwnYfG9Q/5rA/nhc/+gYpDV65UCEPwxDni/k6DNAB8IAtKzsyn+wK
X-Gm-Gg: AYBFou3tg2j77wjTcDma7PSZhmEWk0fTZ57B854vvPBm6/u/QfqsIEm78UtOMRar7+t
	DtBgaou60+iTxLhUmEpdEbBliqCcXSf6wM0hUJh+0vkrt31kvUVPiXSq69sb1+SpliiNHR5em+n
	Fb1Bv/k0O+AABs7lTcqUglm28YY04ilrDYBFFQ1W6QuF6ApzeCEm+tMS+nfzPFqxjfHh/AUpgUz
	aar1ECdK+WgZmh1WKiBkBOJ3u+ACcErdPc4zUZ6DPNlukYFrceGcT887BqvZHODe9cStH9CMQm+
	aMqIgPsyfwkQcnetKWjFnnemjxAHG+aOU8FazaCJaaGJIuTNeQUF6C0FPvwc2fE4/369ZHYU+tf
	Zh3Gn+pUSR1BusarjWa1uV8IYd9wv1my3TDDOA6pcMNm/eshFC2LOmU+Fuvb+gRGM7g==
X-Received: by 2002:a05:6102:14a1:b0:7ce:6288:eb0a with SMTP id ada2fe7eead31-7d03a5a3397mr1252790137.18.1793201251146;
        Wed, 28 Oct 2026 08:27:31 -0700 (PDT)
X-Received: by 2002:a05:6102:14a1:b0:7ce:6288:eb0a with SMTP id ada2fe7eead31-7d03a5a3397mr1252748137.18.1793201250182;
        Wed, 28 Oct 2026 08:27:30 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a969e61f9bsm35094685e9.2.2026.10.28.08.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:27:29 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:27:27 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v23 02/15] phy: qcom-mipi-csi2: Parametrise the common
 status register offset
Message-ID: <o5sj26cm4rwf5w7pxizqln3dvyjfbpgkvfbfqn2isn3bwsxvux@yurxx5ptr7gp>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-2-95f250b18612@oss.qualcomm.com>
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
In-Reply-To: <20261028-kaanapali-camss-v23-2-95f250b18612@oss.qualcomm.com>
X-Proofpoint-GUID: 6DlBI4Xc0IVyHXNkeyD5CDtwMEv9IxxR
X-Proofpoint-ORIG-GUID: 6DlBI4Xc0IVyHXNkeyD5CDtwMEv9IxxR
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae21464 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GCssnZSmVGVrPJfrQDAA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX9Ob5uCbUG1oB
 u0iH8/izeTOnz2IuDGekoUwKziiR20/FLd73l6kZyC0IbshtToY5J6Bq3nEcTIw3kIG9a7xXN0x
 vRlEReqORtA/VTBA21r1gJfpk+4IHoND+bZklrL47JMdlcjC36jrHDwyXhZknnyzs39Putowo4L
 fVxHGpj6Du/zg7P1ALiOYF82QC+6srB5YRX5p06Rng3UWF1RcMS4cf4iKK9g5npGLXlUXZSmA8p
 buiLtxTkCLoNeE6b7WCtfsbR08KLpRSO7pyXURLOTWXppMHiwf8V1sWhi/jkPuNJMBISrdT5BGq
 4rN0080lGWpUrWC1+VumfixhmpgFIottiHMC77f9QjcWGBfFRG2LrdAFaTRfuztSuikSuekqhEj
 YDwoH8TD5DzjhWfXILX0d6WpSnY+w/JaETyvIgqs0sGwSL6d+4pf8g0wMLMCkFSsOx3iLxqi2RV
 ggq49+EPZboNeQx6CvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX+XtnWG8nS4zk
 xdsediX0z5tPLs4mM2BPsm0mQ0/Vlst+tFyYfw6xVqSeM/on1B7HWQMGcD3WuFTede9Z+phFdv3
 RBcvvLCdzY/MQlTafvFh9zWX8iml5X4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280061

On 26-10-28 08:20:36, Hangxiang Ma wrote:
> The CSI2 PHY common status registers are not at a fixed offset from the
> common register block across SoCs: x1e80100 uses 0xb0 while other 3PH
> v2.4.0 parts differ.
> 
> Replace the hard-coded 0xb0 in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn() with
> a per-SoC common_status_offset field in struct mipi_csi2phy_device_regs,
> initialising x1e80100 to 0xb0 so behaviour is unchanged. This is a
> no-functional-change preparation for describing other SoC offsets.
> 
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
