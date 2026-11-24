Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515206;
	b=vchmt5T0nPKyM52V/ZSLjQm8HS+zcCegXraRU0mq/cjU/baaO4XhUK2KU2uYLy9JvAb3
	 XK1JcL6JYKDFuo+8R7YeUTC0cN4u1ysaAWSLmaW0LuG+gaeeCGaqbOVDWHLfp5WRmRsqe
	 /yWJ78YB9za7po56V01gP4yLh+8xenZFEM8Ojr6rbOSsJ8yA7PlzImTaRCQo4NLdpQbK1
	 N8tUEkURwHyo4FosiHUFUa+5yd+ymNuNkjDmY+KaM+aMN5v7lvs6EUiWSExLH7pZTNJvR
	 L/VdCkvnU0UXLBDM6dM3hjrL5g820NwPixaC2OxlK7eEaQglMZLBAfaD0Uay/43vDlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515206;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jXZ6L78F6EFUbyACsiZAuSZsaiYj54Jynp+2S5EVBJ4=;
	b=WB9MFYZEkVGzjsX2xkNREFc27kwMHCrzspOHKzR8eA19qrh1KGkHxhgBjPYZNbhRePpd
	 QU6Y3YjZel83lsKhvUTQZiimD5mBCLtv9M0NDFshN8taU8aDzTusAUBXQ9JPe+RdaqYrH
	 0tphm5eW9q4xgNO2icCKPTxrCvjF4TWz4zF/1DLDt8e17wBFtVdpIzafK4X/0plcKpshK
	 +GQSbkDqNiN3fOMCdFg3Z9F5lImhN9eac/Ohn9C9FuKsMRKBvR+OieRET3p0lisk86BVr
	 jTBONqbwmUjSjjM5rMy85uBeEDKIlWaKWVUgVAup74anXNyyOLHDe3Z5Vsxm0F10tqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="iDNxg5/f";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="LbZ5DV7/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD560606A693
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD560606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iDNxg5/f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LbZ5DV7/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8rocc1598148
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jXZ6L78F6EFUbyACsiZAuSZs
	aiYj54Jynp+2S5EVBJ4=; b=iDNxg5/fCzrJEN/fr6lSGglP+NKGiUTg0bHDgGbZ
	oPvkxENj907CBnVb1tk4xGoAxAiY+79qAGhwrz1hkyrWqfC8oFUGSkHmrZ3/eGfM
	WzDlAKgin54Y9sGk9CmLcFxiKNfkiI3K2rl9+d801pKme6OnqQ1KZJi8HRE7UgSM
	dq7VCm9S+YK6f/zQgWJaSeOnhPfqKPSoZR9HtIstrS1pCDeeLLEL6MMNi82hDyGB
	W4ARPa8jv9Anpp6sji9UegFduGckSPRAUMCpgRPB43O8SsGg/8BLdMpNQyKc1waX
	98BfDijfjQViMKvKsekqkLTLYNkJTSxrWcCnfnSPqfOpyA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqk34x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:13:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a65fca25so3160544eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515204; x=1796120004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jXZ6L78F6EFUbyACsiZAuSZsaiYj54Jynp+2S5EVBJ4=;
        b=LbZ5DV7/mVPB3KRZULtJZkKcUgjyLMiaMVMfOWibgRBeOZYcGjq/a3p9bsnIx7SvGa
         eE+CHdQI+s9FmJYyKakgizCj4qNzerslLiNAsr65MhI+eUJ+udgQiSqWImDO+xUC9xoY
         bDsLq5uYKR8zFFQGtqkiwhy4VJ4kvCV1uxQzqM7YMLPpvaZEKVqO+SQtryLUqHZOyR2x
         79n1UcFuV6sGimenNUwKID86xYfDNl0MyhMw4YVKg3qejHCrT3HcL1eajSDyIQ2r6MVn
         BMSgPhHBQvvCg6ueEEZXVLVy2a/v9c5GZw/AyRx/RZXk9Z44vdm0jmvVdjyovumqwKRD
         hAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515204; x=1796120004;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXZ6L78F6EFUbyACsiZAuSZsaiYj54Jynp+2S5EVBJ4=;
        b=W1gBLQfM+62ouaVow+lWZvh8yC5RVcZzrzSLcC40uDr74HLsD8uWPDveHjSIXvse2X
         7oH+gPM8gZ0qzXxj+8rcqpk76KqQ6IKKq6tE9Rp9JeQogN3HEmHJPjrv0erKSXkxacOW
         fInzJwuZZVkjaZF6+WwvMjbqfGf4O3f99EvoO3kWPid4M6C4ORcnBEVCnDjKRYcqXFKe
         db7af/osnbOAWXvMNxQsXRexBSQRPjNcF2qEszZ6apJdzewb/+JIlFwmBKemzodpUYuX
         go1dHSLCeYVb0uM6tWxDPV4aWyDFGMNYxgBdp9uUxqwgIfI6ln6llIHZcWGyJvfL3Po4
         z2IQ==
X-Forwarded-Encrypted: i=1; AL+hErGhE7tgvhQsuH5q6Y7Nwzjt43lgr/KxYRhiGrLqWUG5gHP43WoKy65UqEMBdpIlxVQLVC5RojUN/nMcoLPX@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qq/OZoRPsUlXWHDX5b47DkIXM3gIA+CzQ5dfBQzJWGMSi2C8W
	/fcGpLq80JodmlAyPmcuqp8j5h9foDULfM6Ucs20d+qX7exIjz4PfnWDgzaN9GoN/zJyn9KpL7E
	MA8S+JIbMkrsrN3KexG3rd0j6x4fm+eBeZwsH+wr8HNeGLASOB1joROkBRhXOsneZgmOh
X-Gm-Gg: AZFdTZeCzruyJB04uyuHaYkcpchoW7msJMzJDdS1X+X9/kCJXSLo1wJB4QWreDRog8n
	YBFpiD9Zob9zZShgnHaoUaI3MyMp2A7cRujPE4s0s0aE2krjqMG4eyZCTzQuMQ7vxnWl4LqHep/
	APbmn2SQdTG9bKzoDAGEpHRgLciuSXY5uowDblQKYd29Bzza+QUbArfjWN6KPuSwv1ZJJEGSPp3
	5QwGXHVKhH0yZ8od/kHwPTD93pFK6liVCll8n6o3+QfHQoOTAmLceWqGAgj5IPeO6P21euKt06Z
	WShDjBc3aMuz60POqcl0WGiGuDu6m+oscxQx5pTG219LEKpvZyixxxJF9celK/Jieydaq55VP9g
	OwS0NGvx2ZojexXHSQTUgS4qw6Pz97u7sfa1sElH1lbW0dOI08Wy039EMoUzdr8lYKyggyo1IdO
	KP
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3856c4b844cmr14143858eec.1.1795515203378;
        Tue, 24 Nov 2026 02:13:23 -0800 (PST)
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3856c4b844cmr14143814eec.1.1795515202730;
        Tue, 24 Nov 2026 02:13:22 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm32189994eec.1.2026.11.24.02.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:13:22 -0800 (PST)
Date: Tue, 24 Nov 2026 15:43:13 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 2/5] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
Message-ID: <20261124101313.vezsh4klcxcklg2a@hu-mojha-hyd.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-2-9d9000eb50d4@oss.qualcomm.com>
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
In-Reply-To: <20261120-shikra-el2-v7-2-9d9000eb50d4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b056344 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FHuKVeeB07r6xee7kg0A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX1nAsojYJTi57
 pMMRcI2Sw+Pc7G6AxHUy0L6aBInAWxZpIQfuZssoSfz1tiDE5Cv4V7AQl2vdFNLdp4SS5EHeUk/
 kzXqL3Sm/RwVIVjnh8X9ec1mt0k2UiaKGXFOExyBvj0wUitKXI1B/CbaDfXXMQUqb2DjYTbaEqy
 D33+eDZqVDanC2Nh+DfUCjVWJHQ35+ip/FjJr4gCiL/WIN+B/v85OIBqFKXjMAyckF9AaUCQvXc
 GAZOBhbVJY/+HMghjQxdl7F47qsho+60vdmCLKRTyMybDg1nnde3LY+1hHUPHDXFPFoEK5jcfYS
 JT0n1H+6fLnW1PtFDSrY/1L/+ZyZtqlqthg6U6ME4D74OTcxA8DzqtjIk6kQtqf0Q3lLHJOjDG6
 fP2oMnN7jP8kb4pFtOk1vLivoC4lIm+YPy02MY2oqBV9lXKQuMXUH5FRLFfC3DmJT/KHgJzTcPv
 owq29XNWGotITo2pfgA==
X-Proofpoint-GUID: NN4gXNdDpcMs5QqfOEI4JpScouRiFHnm
X-Proofpoint-ORIG-GUID: NN4gXNdDpcMs5QqfOEI4JpScouRiFHnm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfXw295Y9XQhdJk
 l6tHi4nvJCkO4J8AGly/IbUumxUtYTkw5NoXxieRijQHvg/KQxZ34Gmh4B/ew/cChO5xACEuuj2
 cQLKo9wfYHOpo/WXN1boCegyR1pQJlw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240039

On Fri, Nov 20, 2026 at 06:50:50PM +0530, Komal Bajaj wrote:
> The number of IOMMU streams used by a remote processor is not necessarily
> limited to one. On Shikra, LPAICP uses three streams, while CDSP uses one
> and MPSS does not use any. The existing single-entry limit therefore cannot
> describe the LPAICP firmware streams.
> 
> Increase the maximum number of iommus entries to three and constrain it per
> compatible: require three entries for qcom,shikra-lpaicp-pas, allow only
> one for qcom,shikra-cdsp-pas, and disallow the property for
> qcom,shikra-mpss-pas.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
