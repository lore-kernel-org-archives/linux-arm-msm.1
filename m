Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8063D1713
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 12:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786018350; cv=none; b=ktjX4dhGsyw2Gnu0LJzUOQ6wGqN15+LrAr1fdgjWqEHerLwfcTYFwDDLNrbNNo5exNHTt1nRu7eYJqvEHB6nd48Cyn72IgITaLmiRqQWDPuoVcYHXwX3xkewsl1s+nbba1XdQIt2LD28PZ64gA+fFFCLalgCspn1R209RGEgpB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786018350; c=relaxed/simple;
	bh=CO0j5QxSovDwEo+nBnRz/si5pFcvZIqV55gzDSyZDSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIjy66E3ymkwzYcr2KnCmXL6BwgQwlU5mZHdQiy5GoG0htS4luvGlh8nhfifowio6/haz8xVY+9cS5vhrpuizlY+tkT2y7EWVZlIEG9PgNMvfBlfVKOKURSBgME1PfCcjjL2QuSyG/n1D+WIREWtUzaee0EUAFNwHVn8ipZqJTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jm288J7t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U3H3OxTD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jm288J7t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U3H3OxTD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676Bwkwx3037166
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 12:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mdapPG7MX35qhwIzJhhRhi4k
	JAxz+b53jaaEzU9Cz2U=; b=jm288J7tfduQQO6gE0n2KsaId51ANZg3o7dmE9PY
	sB7oIfjpVpJKDdoEcaQIv9CYIoUB5TCBURdZFhKrcXmno2vmu+ZAJGA675sVRIH6
	9Ne0BT3Hyrow1IGH3Hv3FVMWrFt+0KqDi6fpM6RtrocS/UvXe3u1/sxKIXt+GJrc
	ZtOUJTFRWejA4/3dCpK4xeXmWQI7V8zpS8ukus3NnqSnt3UVbyqPbeZ+VfKe/QlQ
	nCH6c0NnitQNaCwejPoa48SnrwBydUoeCnStQc6uW1FB/aLwPOLgDcuyEe+DaDu9
	ztbdv6QMKExSDi6UqLGdBss7UPeaTo8ycunLmf3o5XW5ew==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvsvd01vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 12:12:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso3667822a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 05:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786018348; x=1786623148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdapPG7MX35qhwIzJhhRhi4kJAxz+b53jaaEzU9Cz2U=;
        b=U3H3OxTDfRPbleWFCyabCjReMB7yNF5UozOcmwrwvg0mW3NsL3nMx7P4fckxSmRzn7
         z2gf7AERFrSt7cRKW4BrgPa+40oYYGtl8O77WybyEpnhxYEWUZ2SHzpQExAUxUcp9GZJ
         VxhBys3qLacCVXMYE6NcTmdzGWwUwGaUh1pMaCoLajU5arPnSLuIYTJJkyqNRTYjdODd
         YXQaMt4Z+Q9Sx2zupwktunY2GuRy5P7kknezBofRKjnr5iKrVD2wnrbfGtm+bCc0elh6
         XNMCWX4zaqhALq/M3e1RZpx1t86jz92ePCDBgbGguSiyKhWzuv1k52QJZV7kj35ONNSV
         ReKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018348; x=1786623148;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdapPG7MX35qhwIzJhhRhi4kJAxz+b53jaaEzU9Cz2U=;
        b=kQAoTtzO7Tr1OlH5QaUudicvc2G7IySMjFU887bfYBDqkseuCNBGbp6dWwRxIlZhyQ
         1QHtTUZo3OwphowtROIxjKY2pjFCqpWfnAfQBFvO9vEF7dbsDKmYmBp1ydHLZ7quCv65
         mOFExxazptvYC9VTAhnEtqCWtKHRdYXFuH3pQMahrnENosBqblrZ320RanrSOx+dbmHs
         ROBWwcv4gZPjYNC2KiUHMUmbLnqRHMFkJ9qnKho8WEAWORIInd7ATUjgvCga3voaaV+K
         gyLgqb1kB46lZPgfg9wjR6x7pC2h6nimtjsTTby6WdwhlIsy922Ppo+w0xxeDCUVxjRt
         UwGQ==
X-Forwarded-Encrypted: i=1; AHgh+RqDZh94w6qXMCS9v2E4cTkajRbgzuSX5IwmDUQwvlBurtF2ty8vcD6JvddBsCeyap7pZNYqZJPH71sJksfm@vger.kernel.org
X-Gm-Message-State: AOJu0YyCgVSaSLRyK0gagpi6bYV9kyv7popuOvw2C71yMtgaCUHEV6Gn
	OzbYWeB1aVmwNEO+V3mB/OuvZk6qfFYX3BZ3hit7CavpIwr/f8jIvcFnh7ewJcmQ6vGMyKWF21J
	qc/NNpr8YFrRI11llLdLNQI4y946fDTXWM8tMHavwadklse6DmUAENQgfJt4A+QY+Yht2
X-Gm-Gg: AR+sD13PLFr07aa0626TUwTN89CYWwls/+Z1u3ZG14CUC2Oo4aHc0Ec0BrvNN4Y8wKj
	fbbUy1LGggDXxNZRETPiAUdCrbnCnp2IM2/Qn3aGxUjhHTq8mfQDyEi2RoWr6JQebL59RA5wquj
	SEPZQUpxnLCIJ3YTC4cB6gDjcQ/+8+2L76VD69489MiY0zl4SHKg/r7ts6I/nFlc4Z8ipFSASWn
	L+RFTKD6EPtYsswsgTlAD3QOjDZO90Zk22UgC9O3ZGq78/1Jeb6UUhhjsAcFgWbddQY8+BQDL54
	36J+SLV2XEAWtK7IejjUMU4ZQ7ar077C+4GNlKJQcwWAZ95/RfSgm+DzlPLx9aqt54PfKIgd4hR
	w74F86/AqmnyrjdUFXqBrYj5iYbk=
X-Received: by 2002:a05:6a20:430b:b0:3c4:396d:4a6c with SMTP id adf61e73a8af0-3cb85dcaf9emr17702749637.5.1786018348205;
        Thu, 06 Aug 2026 05:12:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:430b:b0:3c4:396d:4a6c with SMTP id adf61e73a8af0-3cb85dcaf9emr17702669637.5.1786018347772;
        Thu, 06 Aug 2026 05:12:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863fd2b3sm29733045eec.7.2026.08.06.05.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:12:27 -0700 (PDT)
Date: Thu, 6 Aug 2026 17:42:19 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: usb: qcom,snps-dwc3: Add Hawi
 compatible
Message-ID: <20260806121219.oydkvnfpbfjkktsj@hu-mojha-hyd.qualcomm.com>
References: <20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com>
 <20260803091441.3040830-4-mukesh.ojha@oss.qualcomm.com>
 <anReh4gzTjkD4u7c@vaman>
 <notmuch-sha1-a1b83c8fdeaa6e5292b72468415a18abf11af9bd>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <notmuch-sha1-a1b83c8fdeaa6e5292b72468415a18abf11af9bd>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5NiBTYWx0ZWRfX9vxzJUBSrtsF
 43li1aX6tUAdKJsvygWJxrBk83CMynsklKcs3d4Xx46n0Mi5DGtY71+iPmYAKZjMywzz6VahqZf
 qnX3nsKBZAmr2Voy5GWjgaKPm4CvWZU=
X-Authority-Analysis: v=2.4 cv=WbY8rUhX c=1 sm=1 tr=0 ts=6a747a2c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dfNa0yi7GIg5s3L2rkMA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: PATQ73nFAZO1PP6SAwTGUcAxZ5lennfp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5NiBTYWx0ZWRfX1vtBekqYFWUt
 aLbK+e6B0XEix2I14sUWvzYo17b8RNMzGx4rDLY58A9LJtHWj3amOEQS/xtOPLKH1tmpwNNhAUH
 So09NU3T3DAiAGj04e10wdQKQiw2G80u0Eru6EeFou0PQ55lcODk4ybXEhAxK3w0vJ6nj4GWl6+
 I764wzgIkh7T73O9o5W0lcjX9Aem83owzXbJYLe934pC6d2zFVk4ISjMIzEyI7EFruamBu55TFi
 SHr4gzk1RsHJasQMS2kovD6cOulG+Zlgi2TvU42LAQRewl1tfx4VXCXoAL3KkPLdXgpg+FPtu+8
 ReZREhwHjpUwc57hNyOyzpgDz8mS4nznYqzhiqvfyevf/I0084kfMbkqRMk9Vna5b5Zv/ARPorf
 D4ta/+LuQrXYi8mUOchLCjaLtWI1WhZok3RIopyy4vk26YqRCjxO5ulB0p3E9PtuJ5TbRdv2zOg
 v3fTqbF6M0ymLEgQbpw==
X-Proofpoint-GUID: PATQ73nFAZO1PP6SAwTGUcAxZ5lennfp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060096

On Thu, Aug 06, 2026 at 05:10:01PM +0530, Mukesh Ojha wrote:
> On Thu, Aug 06, 2026 at 03:44:31PM +0530, Vinod Koul wrote:
> > On 03-08-26, 14:44, Mukesh Ojha wrote:
> > > From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> > > 
> > > Document the Synopsys DWC3 USB controller found on the Hawi platform.
> > 
> > This one fails on phy/next :-(
> >
>

3/4 is not applying because it is based on linux-next and some patches
missing on phy/next.

This series applies cleanly on linux-next., what should be best to do
here., shall I send it phy/next ?

-- 
-Mukesh Ojha
