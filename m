Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEE34CDDE2
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658401; cv=none; b=FzQFoawAoYnHEOJEKQfdtHXpNBiOe2RCsuFAFYOF5KmUREjzVtDzku7LhpITyl5+zEICj94WIFXNhOZmzifUQBMEVgvBJIoDOlnJvK2QMTzK3lJlZbjp71nmBtRJwa/rkqkQmLr015RMAXO9FXVmJyHn+f0W21Y3gJx8HBXLCfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658401; c=relaxed/simple;
	bh=zOMmC06OkIP74H7DFOabF+/thO4Pnpmshs6ryvpXMFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCkIS7eZQTrT9MYldxBibAgRJAR0DfR/wg3uPYv7jZHLAjPgSSXixIS8M172joK+z4P+fSDU/aJFy9lOaXcguijZvOqdQi3QvRICnaklM27GHENi4rdojKXqbAPa1AF6HkcuYW9xHs1+ImmdkzvphRLckLP7dB+e2mTXjAWarrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nsATsM6E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aY/NkdEm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nsATsM6E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aY/NkdEm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj3ai2777297
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3LkA790cRq2TwLYlSBrEjEfJ
	DvHMNuVtDFarizUSwDA=; b=nsATsM6E2sw/hM9M6Uj9JQrrnA52VAs0eevnWhgw
	WOaDaaRawKAAsSSPylfA7/eKVmLlnhhWd5ONxJEQaqeAdC8H727mUIhxQbtKlg4w
	bh2cKXc4KDyWjVXmI0oVvIOsubKOyjBmEm+F7+33W0fHt7/Ghzk564Rt9Cetp0o5
	XlfkksAi6H7JFCwaABTetQbNoPYKeTPyokXuliexlnf10fPlKaPmuOY7wCcVKXU9
	4dMdybKqontNW0AQCS4Wu69XpQrQeShueRSs6HUgZfQiDzzg5hgV6tDcNoHnx/mx
	tgZbI3a7CaQod6g3QmmW4MwxbU4UDCGGk3PkvVd89PnROw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m37bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:19:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91213a1aa68so13889946d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658386; x=1790263186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3LkA790cRq2TwLYlSBrEjEfJDvHMNuVtDFarizUSwDA=;
        b=aY/NkdEmRniAWwQT2aC0khzqxG+z2fPXjre4EzgbckTmzsPJ/2qekEQHHqtm3uybcp
         wox13xTBpyu0C3AfjlwZB2t9nghAC721M5eajUE9BNzkl1k3Pw6aq4YYDFoOQbj8bcCy
         cpL0Ji6oZc62lZuKUPXGrcytW8Bz8toxn+vpjflh9y1G2o0V4YrT76Le5xN6mLlmIOT9
         Ek8Rc3KqF63yGNkp/HprISSo+KcanjKl0v19YqXKEm+cAN1xRJxsg554U8gSQtIQz1Ae
         bGFIf8yw/DPu0dp83B82OkzsimU8QXs4oahQc5Ppsz7Q/b1t2i8MATooAwA6fe5DtLhv
         rgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658386; x=1790263186;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3LkA790cRq2TwLYlSBrEjEfJDvHMNuVtDFarizUSwDA=;
        b=uK3Edm68hh+YCRPPh+WSo1eBcXzsRLKWuesU5XUs+/OVyRPvnl5j2YYty9vc1EooNQ
         QroyXzonhtcvk67DYYUY8PPqAHbGCEGK37v7xgK6PiQOoqcbLqmWgX76wbyJLQuPlcwc
         P+mUwKPZpEEkhx1froASo7p9ktxBN7ms85OZ+KPcCRppeTJpBT2aMjWEnec3nfNDZrqz
         kTQGSTihAfcI1frrPqs8nWXXcWFrzHAFIKkWeE4Y2H9BBRgYyZVNPwbgIeSs8JKogYJM
         v9p6H+sKP4DQbt00Qf6RS0/OBPtMIgSS5WuL9+vP8jXINkOjZThmfrPlI3YGD9Cw+Ru3
         XLPA==
X-Forwarded-Encrypted: i=1; AKwUvBxuG3WWxCbXNh+GNVW4pt0gPAW/u8/2fQDrn8Zctt0cX7KmQU/2ITU9+Ig0EysXNCo6SCdqLCx8WP+c5oWE@vger.kernel.org
X-Gm-Message-State: AFuF++kuiBO87CkPj1ou/+CSrP3/GEYk6eFqLVJEhb1fKwsmpIcur4f4
	4q0GsTP6MNQDFF8z+I+isCoGxOGiGo9HlEVOuI5GTmOlmiLIfKgfeNeDHoFZtWmOyQEB9EtKK0B
	SFV1uO0+UCehQB2W4ZNOC/83YCtT+bL7KCsokbD8pL1Nqdj1MENVKEDsufvI9JhuLJkTB
X-Gm-Gg: AYBFou2b19HsQUudHODVmV4qQWibnGlIY5PCZL0JL4r4k9eD5FQGhSGa62n9gBb4D4r
	2uD+jYGiexpUQ6ui3/Azkcvtz85k9k6ve36ieC0u3ejzBBKSSXZ0KwmmzxRn0QFoRyxC4chVgHD
	LRiIda5M0bArjM76L58PFVlHBZaQIJm2XaSFwVMSaTn47syskXy61K9tZEgqAS4t8sgiKp1gqie
	It15UOQ+yayWk/bf4KCEYOU/pkJ+yssvJtQK4TWxrbPOip4BUhW8OpjpsC+hAxZ5IvLLx7/G8Wd
	1dFuIyf/yhxe9o+sWpwO2XkuH4QB2ixFdGoPHz/RSbabQnPOmP1ZoH0J1l7K+ehAepLjDxvrWbW
	/wmdaMfxHYrz5/Ik=
X-Received: by 2002:a05:6214:daa:b0:912:517b:84e with SMTP id 6a1803df08f44-912517b0a5amr13032096d6.50.1789658385902;
        Thu, 17 Sep 2026 08:19:45 -0700 (PDT)
X-Received: by 2002:a05:6214:daa:b0:912:517b:84e with SMTP id 6a1803df08f44-912517b0a5amr13031506d6.50.1789658385382;
        Thu, 17 Sep 2026 08:19:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf418dcsm16359336f8f.35.2026.09.17.08.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:19:44 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:19:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/15] arm64: dts: qcom: sm8150: Move PCIe phy and
 GPIOs to root port node
Message-ID: <nv6q5d26sreeh5psbtvfcodqfrcdnck3ramzsum4m7x3hop6pk@eoq2cun5jhlp>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aac0513 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: JVLkHP-k-9rZZeTCdtrcRjDgiq4fQ45A
X-Proofpoint-ORIG-GUID: JVLkHP-k-9rZZeTCdtrcRjDgiq4fQ45A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfX24KF86vqUeGk
 D3+USJNZjN2nPYy8L830R71A2v44FQVBcLfxOKkO8wf37NlwSD0sKvf+s1weuGjWvR5vSsWzUKe
 8nZQw84QyYxQydmVxSTm1uoa9MIPLWw/HMsDsYEt2nf6nriRPyfb8+b/rtTJH+ehM9zQ8T9Bucu
 8/FpIkCDww3C6KSmC/l5VfL8ZbqX9ywE5q/hoe4tB0knNa5d5pWVeW6hEgB+3erYv6fY9t70CRo
 ZHjsDEWsq0H3mIkO4OMDBSNpYJv+o4w/7/+tEXwvS+a6i4nNDZ6TfHfz5Hx5AgHkpFwcmaBVlJ7
 eAzX/ZLZBjbqxKkUBZCr+bj6w42bb2m6dkUXwOsp6HNepGF843ajUf6BktrSfU2jbkxiOu0IiPr
 xPDQMYa3qVu85UcoADcRslzAk+Cp4WLQAqfxFBaAZBVRbrYlW0fhiapdBIE+Tpewlan4q1W6srn
 gjCm9JriovGzD15/iJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNyBTYWx0ZWRfX3IOenYrjIf6h
 Pz7daAVridx10OgMAwU89d6JngzP4Qt1vpaFzsQc7GRsVZtwJKnacR5EEN+NNnGDILrloKXEODL
 hRReBTFWHBeypFJEgeG1LEFpPkrUMCw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170217

On 26-09-17 17:55:21, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to pcie0_port0 and pcie1_port0, adding labels to
> these nodes to allow board-level overrides, and renaming perst-gpios
> to reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
