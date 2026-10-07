Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA23E4446E1
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 08:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361682; cv=none; b=XJDoaltFlhiZT/eyP/83yZJAIOPSisiLsIgoW7WRnXVX1jOmXV7GpLfsRwf4mvfgfie2MNDZ0HTkDiufhOQtgjmyYgIkcSp16pFHG6ZoW8v3RJaF6QkIKMiYVWSU4xC77g1XcHHsAjNzxgJDJydbbJdxv84zmyNkta4uZGwvhSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361682; c=relaxed/simple;
	bh=ssKQD9BcM3CQbUK9x+g/1XRHw/eSMfakZw6DJb5SrFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUL+zS76x8x9rqhXBvhw0uL+QNekwxpt0wW5L7vv7jReO6mRLC+xpSjDEARotBvnsPZj6JYAIs6gXdXh/baQ0yxyreSas31HOYv6XEoy4xVpoZMitWjiYdUyqUmwHTUEv61auXec9yULkxxDnCOxu+/xgoleFsidQ97pTwj6fjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nj3iRZ0o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cVi0LiX3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nj3iRZ0o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cVi0LiX3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jUj6118869
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 08:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Q8pejVtvwEZY0CJvyioOv3uZ
	UkPCWhEsgph7Y3WL6kc=; b=Nj3iRZ0oHMRNpu8bfSlnIuvRndjXLi6nECGFp2yT
	ZNn4syEZO05KUq/tq0R1NUNJ/zSZ6XCdzmbUy9KIqGCh7tqzlK2ZuHTAx6w9nCS0
	kXblAZqmvVJBxnRCXy6My+ORzRwPfFy1JfrMKipdIupgN9umngAK24gKe9OPlbR7
	cUMRA99Y5LLJF4Nr6jZCtdfI9uvYIFBuGTrY+CmmpoDymZXO2tmm9ofxEkENmjUl
	o1zhg3T6+gmyeDfqFUINIzP6Tmhu5mukagdlwWeqAvwUIkmNlHFPmNOgWYp8YHOn
	gT4T5q4XsoLMWhMJTec6eZjkVJUzIpCOLQBwQk06q9jrLA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc58m8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 08:28:00 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1438719cc1eso5656446c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 01:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791361679; x=1791966479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q8pejVtvwEZY0CJvyioOv3uZUkPCWhEsgph7Y3WL6kc=;
        b=cVi0LiX32MBI4wZG3Mej8RJ2TFWvRuxk5dmwSwUFzLoFfqwP+9SmyWbP04Z2jYOT7n
         +v/a80P9N5NBlFE2BJ4KOiRfIbD6yjS8wQ3T7HwOSOUVHwgsrB+7CHqtq/u+jva06IZl
         /FLZV+61t2rmsM6wiJ4eKXGfF5gTPTY0BP7+q5o/qWypekJdHoxbpBMQsPgIKGFl+PQa
         5jFaUcpBUhmqG+AIKtmH6IRyX4AdO6YRX1I2krVmVbyUF4Hzpay6F/yBQi1dV5utwCJk
         YhGPWJ96On0blliSKgMnN3N4JHR63tRAiK/mcwSy6wCMBx6eCuKChkGS2OIXQxpgV3BQ
         /qdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361679; x=1791966479;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8pejVtvwEZY0CJvyioOv3uZUkPCWhEsgph7Y3WL6kc=;
        b=i/scysrunJeJqd5pGZAmiBZR6aMTzegO2ViY5y4r2pqlnDhQXjW2cBstL0KH3h0wB8
         YO9ssEvpWGX0E8aFQMcHb4H1IMWJzfET7qwoDsguVBVeU9R4It2YGs4tSK+bfMt93cgO
         wjO96Jnhedqrfzu0HPqBihMxvI7PL/sAzXj21tW/nOKe2b+RQi4slhozY2pY3cdn/Qbj
         Cq2buKL7dYuqZYzIXog+1KpTKSY4ibnOwiTNQMpnisfjkngQlOQRG6J4JRhn91K9j6zK
         1uHs4LiSNnbK2yhREvGy/lEz0q/ZC5Jqe/Bg5+nKRzTePl71Jbu/SJYp4q0WjkTXnfMy
         L3Vw==
X-Forwarded-Encrypted: i=1; AKwUvByNIQ4E6fsRSRwg3euooGjqzq6QP7nnzXXctQETM9gRtAyIgseumgNsTNdA7Jas50P4SeAZ/KPmv6fqRABT@vger.kernel.org
X-Gm-Message-State: AFuF++ktE0pSG+eOjwqEIViyXHCvW/ilcMsCr138Q73biRv2+xKDrKJW
	5x9ALxx/QFtsBycfDvnbI3eHjq2XlATrJRX2pXO9ZvumEGZBm4t1M6xPJGaUSzH7/Bcov4+TplI
	V0tEIZourDP20x6MHz1fdqVPwfv+/QkhQgJJ7DRd5I45/QCDiGo+tELgV3C4fFpUBEdXY
X-Gm-Gg: AYBFou2/pVVBKjOy6BKDYMDrrhPF7Ljc4mCu/PRkgS9djPvht0mpKWh84n5QJo7fcx+
	5KSoQNUOsUw4aOCTWMk8aJgHOQeV0/CnNHjW4Mo/NQt85oIIn70VjUdCt5pUAHSb56KNJkExoIQ
	L/0oTeIeCw3Ru3E1gNf/XyA1dIUVtRjEtrOU8IV+tn6zHeeBDgZvdFeMgrmtzHeds9ZqH2HIrtg
	522NY8ceB45P5Ut5fWzsYkggf41+XXvOw31oAnlF1EB79a0dZLS9rIKKwZeIZtYg2N5oAVuCjz+
	3AKueUIZbbcd3Zizf04MaTLq1KI2x7FDTZvj4gJhAuAI9PFxJtIELPMDF+Nys4+fV8m+aMzFc5Z
	CWfN0wGVsG8cJdzBhGZs04ESbpA==
X-Received: by 2002:a05:7022:3f0d:b0:143:3c9f:109e with SMTP id a92af1059eb24-16208be0009mr1524596c88.41.1791361679052;
        Wed, 07 Oct 2026 01:27:59 -0700 (PDT)
X-Received: by 2002:a05:7022:3f0d:b0:143:3c9f:109e with SMTP id a92af1059eb24-16208be0009mr1524566c88.41.1791361678408;
        Wed, 07 Oct 2026 01:27:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16167ef2e54sm4519079c88.10.2026.10.07.01.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:27:58 -0700 (PDT)
Date: Wed, 7 Oct 2026 13:57:48 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
Message-ID: <20261007082748.bcdhzhqsrl25nimu@hu-mojha-hyd.qualcomm.com>
References: <20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com>
 <20261006-glymur-dtfix-v3-2-44e2bc5370c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-glymur-dtfix-v3-2-44e2bc5370c2@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzMyBTYWx0ZWRfX3ZyxGgi9eMSW
 QH1OyPPJVdId66qekvNRqdHqlGSAGrzUa/HFAON9BPakUCIRyG3EEe9eryaiq8pwMC9M6LGOtYL
 g9jK0TtdBSahT4SBleAZ04VuWTJHjus=
X-Proofpoint-GUID: lCNNGMR22ecRvz0rjBGHVa33rGhuHksH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzMyBTYWx0ZWRfX2e/7aEvNV2JX
 QtBvd1HZ2KhsJbOMPYrTXBPfE7XljyZ2A0VSdykcR8bpJpdMr8lB2ukQd9+NqvuhPIqHcWrOq2k
 4yp3iR/b8c0OjkTDswaK5M+LgVeadzTEBw6jlrrnLIynxZg4s1qIveHKJW58Z4tQ/X32RctiL6h
 D1r+oD8BbxgRMnoFUxgBi6t+9u/nQ0fbab/5FiXnn0NjWSD++Jd9c9bUstmpEWE6pbXj6xWT8EA
 xljS7e+e3PzEcF+HbjBBYEBC/Ej58NvDx7LbVqFjSxDFmBStf2Ky9Lwod536pjZOUEafdR+I3z8
 fGCtmPVoY2AU+1xjTEfZsEnT4GyYWp8Zkzpi/vuSUii1jpNV5rmpTLE5ZlWDs25XbxRVGwlnxD5
 6AX26VSIcHMMYPYHRwRas/shfuY1SiTs3Wh/gXlZhLiplaqOWf3ylSQ/uTLEUEVucraflf7kAar
 b4ilEOBsWO06HcADG5w==
X-Proofpoint-ORIG-GUID: lCNNGMR22ecRvz0rjBGHVa33rGhuHksH
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac60290 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=v2SviNC_9pf3EYpT8dcA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070033

On Tue, Oct 06, 2026 at 03:56:07PM +0530, Ekansh Gupta wrote:
> The reg value of a compute-cb node must match the SID (the lower
> nibble of its IOMMU stream ID) it is associated with. In the cdsp
> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
> mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
> 14, which don't match their SIDs and leads to SMMU translation errors.
> Fix the reg values, and rename the nodes accordingly.
> 
> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
> Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

If it is possible to cover all the SoCs like Hawi wherever this issue is
there ?

-- 
-Mukesh Ojha
