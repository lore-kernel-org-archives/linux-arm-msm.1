Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD12530C16F
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531153; cv=none; b=Jn2GlioDl3FLnXvlHQTr4AdkCpKEQ9izalEBdhjRiBaNlS/8b6zVrJKb6diSCxNDFulT1Vyfi0pUkI5EqkcXyp4HceFjKfsbaYobECzOyolJavjo27+ICfgiywGIcjuKfBEy28TNvfbs1ZvXeawj6VVWFK8x2uLHQV32GipeU80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531153; c=relaxed/simple;
	bh=nKkm0p6oc4UbtPY8r9WSLDrfp2RzUDNVeje7EXajBEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzJXf1sWoJvHkIMZTiQYJlXSepOHgDjMAo77t55Y3eQ62eeS9CD2iTJBU/M6ELA1bWIJysuOox4gj19m1prYeRRxF07QguxKx+XMXdio/hHNROzvx1EfJd2gtgZxZa0zM+MbwJO1kA0Ed4f4+bII8zd+rBuI4h8+ru5xNO0gaus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i9siR4Th; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLJWlYEK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i9siR4Th";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLJWlYEK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9frwP3777858
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6Cf7E39uNduEP42oZG9zli+Z
	uRSKRtpL1c8Nhdz/1hA=; b=i9siR4ThXKRaz5+GM82tsIo9rCjsxowCzTZeXmTB
	wpS9ibFNK9XTwEOt5hpKNSFEoDIAxX+pO7QD26m0EbNwVyvwK9iSmB0G4T4EX0bm
	FxvD//mFzm+Lcojx/Zl+td45OzhuH36Pbajy7nhh8Jdre00YBwg8q+a1xBXXD6e+
	qB3AFZrDlwDxwoiwtNMq5SziXqJhvJ2oneB0RIJN80T3PqjJ0TAtPUk0yLeWElw5
	IDcIUUpFoG6uezL8BBXfKMkvm2yB3mEc1VPWui3DC23EGV4+QhGMGdE4SVPOUEy4
	Hr2ZqzS30avph2JhVIc+VutK758fQfuHUOh5Ss4I2UcPIg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nucgck2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 10:39:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ebdfceddcso9325631cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 03:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786531150; x=1787135950; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Cf7E39uNduEP42oZG9zli+ZuRSKRtpL1c8Nhdz/1hA=;
        b=dLJWlYEKPPcITAUhRk7mCBVtoDQOPk8lWCvIAJHjN1UixYxR7F8fa4c1CCK4Ozzcfs
         CXIhyUOClQOKzZq7xk03hPwPjsoXlOW3tvXjeY2WGIvASXwp7HHW7PVm+4KYggeIzBWc
         kZ6g++TwBXHIXuVyeE/mdfCmxnS9x+rcaYTyI5n+BJhyQhF//k9M9GqwvOzxE4YqPAqN
         J50o5nBsOK3k8HaVe8d6qK0XTh4zk4S4U8n2t+tNyOG0in32ybcO0q3HFfxhuu+MpfH3
         4xTVbOu+gjIF1Es3+gIFpoe4o/9ddv/P0Bl6xa26nDUUyIObcCss2juNMvcS+Ql6e8fo
         ThNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786531150; x=1787135950;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Cf7E39uNduEP42oZG9zli+ZuRSKRtpL1c8Nhdz/1hA=;
        b=JJyxhz+BgyT8tYYT118JooConykE81gkjCwj+gA6tj+2/F4n48GHMxKc+OKvjTwc3B
         YaoKmVyniuHjiYZ8EQzJ1IE69SyfpEPIbo3fcG2fqCfbwrKTyZXiDqE79aJL3V0WhrXo
         yqeqAQaZ6kvDaTyAEoO4tcdkZhcYSGcSIeQ8fwuMlqR/hodVNsUWwFv7sdyoJULZxls0
         jJcgEemUDv64vYPaGKgo1wd3M2JceunyPdi7/16JMAiNuRgcVDbu9BL7KXZ1RFHw+Cqy
         L944B01XyZRrjLP9uVeJROUKlGcb/B1gBNJn/rm4uIP8UPhYDw14ZxoKYvkK8JEu/v04
         5PGA==
X-Forwarded-Encrypted: i=1; AHgh+Rpp+3gI2/FyQLc7ZPmiYLlji1iDfytWWjbEob+Kmzy2rRXrr/2aa1rm4iVKAsuGC+CW8n/rERb4eyDQVg/q@vger.kernel.org
X-Gm-Message-State: AOJu0YyWqO7bFduso8LmQuwhMQr0zGWZrHWvCnYcE2Wx1tuoZzXdEuOj
	OZaTxl3ZGj2BhoV+L5DvdenkFR8fK01Sy6yQlf+S9MQqyz8bSGKeSZbLs1HlH3rjh6F2JGtw0aj
	aNCKVLhAuY/vQy3mqDehQ8HsYPtM9/94r2Cs86QT/oaL+K1fI6RSJhjRnVJkBWWz0OSu7
X-Gm-Gg: AR+sD12ooKy6bL+u6FJ6K7GSlFkspoiSz+gIV0y8wYNHoTd2lTNRzwpq1ttxYjytNcs
	cpBO+a4sBzxY3R3wBmoQIIHv29ngFQgaVqXsRqJAEJLQpNqEUk77pebxW1qbcOFDGzLDbuOPAFF
	NNECtZ8EIjbiNPWIYwcmctwqyBvzQN4UQ9tCx2E0jnJ7N9xxfrecT1ksg4e//Gtf4NBvRaufqjV
	B9DEcIbDVaw6RU5kK6hoAwme+bcRwTas69NGWLGCzkfwtJi6XD89AJEHtHc/ebDi/8BOvk5hrKe
	0qUjk0+YVrKQEP4gH8IBtLNqcAfMuLWsVB0kr3EVAfXRtXA3us9wtyDN9myqxhbJCRTrJK7gWBC
	deJck6EgbT21u6Uo=
X-Received: by 2002:ac8:7e86:0:b0:52d:3352:f7bc with SMTP id d75a77b69052e-52d6485f5c4mr27694021cf.31.1786531150000;
        Wed, 12 Aug 2026 03:39:10 -0700 (PDT)
X-Received: by 2002:ac8:7e86:0:b0:52d:3352:f7bc with SMTP id d75a77b69052e-52d6485f5c4mr27693611cf.31.1786531149376;
        Wed, 12 Aug 2026 03:39:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d709dfsm6289640f8f.35.2026.08.12.03.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:39:08 -0700 (PDT)
Date: Wed, 12 Aug 2026 13:39:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH V4 1/4] arm64: dts: qcom: glymur-crd: Update VREG l2b_e0
 and l9b_e0 voltage for SD-card
Message-ID: <pbqwc2wyulq56yksq4ts55vwkysmqprcw2yzbxlwyvxria53yc@5yiwjpxnkjib>
References: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
 <20260722142342.990384-2-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722142342.990384-2-mchunara@oss.qualcomm.com>
X-Proofpoint-GUID: XRkpbQ_Pe9WvarKrrqJLfy5juguy2DrC
X-Proofpoint-ORIG-GUID: XRkpbQ_Pe9WvarKrrqJLfy5juguy2DrC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA4NSBTYWx0ZWRfX/l+0EPZKFYBJ
 dSzMSR2a1RqIjyejbxbZV5Nage4YKUMGbY3jQKfd2NK0H5ml4Gh6qbBpbNtmlCoyxnn9D0ggk98
 Kt1lKNNctfGPG2QC/6Lu2rnSKM+2QHeIkizPr8E2bRW1b+QE4ex98gybYfLIzk6xFfPdL+Evnag
 VzJ1HtUie3ZdDJJ1dQN0f1N2aUBccHVBR3l9wDP4OlHK9A7YECFUkGyuf/rebpBxiUvfScCGDsy
 yKv8Segi7oK+5EXp8+YU96+KcPzI2yt+pRRjafVwjekucxdDSBSTSVAfkve8B/X1yCeotLNBgS6
 Y9v2Avfk1WKxPbYFSx31V4ghmx29efBDWNg12Tq/FZSuf2JwUgmVWU2Cg7EBQfBBkC6U2WtcEzw
 oV31nC+P6bQ4mDkKgi2nSJrDr5qgXsKSoE2c1/QZpSTne8ncIk/0ONYvVnk7ZCzoQoZ+xJyHhtu
 PcbPDu9vg7oA/Qnj9Ug==
X-Authority-Analysis: v=2.4 cv=VcjH+lp9 c=1 sm=1 tr=0 ts=6a7c4d4e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=o07dIpAjZdj6OISZKn0kaw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=_FQnCXsvKZllb7IERd4A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA4NSBTYWx0ZWRfXyMYhInts4suy
 hwp//6UsQfsnnG5RWQ2GnWitWzHj5CXUebdGWGGhZ2/t4vn2q1oIfYhBk8I7Twt1HsrXHoneVDk
 Xy23WRaY8lGp6wH51XwVVxTl8Lmy8rQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120085

On 26-07-22 19:53:39, Monish Chunara wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> SD cards may need 1.8v VDDIO also to be supported, to accommodate this
> requirement reduce the min voltage to 1.8v for `vreg_l2b_e0` which
> supplies to VDDIO pin of SD card.
> 
> NOTE - Since this SD card is the only client on this regulator, this
> change should not have any side effect on any other clients.
> moreover, SD card driver takes care to explicitly vote for the
> regulator voltage based on the SD card detection sequence.
> 
> Also for stable operation of the SD card increase VDD voltage
> supplied by `vreg_l9b_e0` to 2.96v.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
