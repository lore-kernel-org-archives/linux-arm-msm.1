Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B031C2AF1D
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 06:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526362; cv=none; b=KptZC1lL0UE/acakmcO+BAX7NsR02VAGu4XdwFWJPcUtOX05wkWFGvBCtDw0m4GzA3uQJxdSFMH4cvNBhpLq7qbRYorGIJmD2rlT7PsqXzmfcQyK0VC6qsVZDxKvxH2/9Q+jZL0P1Gaoty3X21l5NYCH8w10VhxEhfivD9ys4jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526362; c=relaxed/simple;
	bh=g+o5GorNkv8qi9qYCJmUtBjISmcF/Ttgm40UCw9Aams=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cq8fqtfeW1IHHH4GYpnitFmo0HcPeUTJnvx245WhK/N4PgYh1A+4Nz2RR8mVufsIbfLoonCkZ8gPL2SxEeDPPpZPqKw0tjWNASh7xRemipcgUNAE8OLIUS8/CcF9h1zzQlq9++Ha4tbiol2WS6EhLLzn1O735RX1vmH1C70ka0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rxe0ZcDE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTpErgso; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rxe0ZcDE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTpErgso"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993Hgv3250718
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 06:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LIPd0Djbu8CBc4zLDdiv751Zy4DXleUy72RpLYJZ1zk=; b=Rxe0ZcDEYe0hX30i
	Mht6EdKU59lRhEleUm3WrCPHGk+ibhZsIC2cssPY2tP0QAcQTIZNyiZNUeV6V6Oj
	IjBgXEy2PBiV+sT9bgmpo1NnA4FbbaqnAsSzg/27XGiUx+HTibWFz1lQXr+S16rV
	1XiDYYk6d/7DtSWKCIaBoykEJFWCoPLDTfCjVyy7GB467ED7bZzdVGgn/JhgI9Hc
	ZKHZ17CWJ2orPi0OGgEfuQMfKTCQ0pkrxb6qisBh6dcntGv/hN4B/UFjA8ZcR7QD
	V+YU/OzQfSkxdoFbZFPx2dDA7w6k0oTgofHTW2t8+qs/n4263cr+U3RvH5hUgJId
	iexd5A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmqt9v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 06:12:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso11516410eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 23:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791526360; x=1792131160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIPd0Djbu8CBc4zLDdiv751Zy4DXleUy72RpLYJZ1zk=;
        b=CTpErgso7smKUWwjSo1IVIhNoKYNjWXiHUWoWRp14eWkoDaFt/A/Ehn20MPKPfUW2T
         IFwb1Nk5VDsyW/2IAgm2ZjzvzVLzE1kUFFNyi7HrVG3B6e46Vxdg1oaIwKw6qQ9zleJQ
         AKfyFkny2NiQ9nzL4tR6qcn7HLLpKc7C76kNPfqPgptCSmCvstWV4YB2oJaPXndmnAsq
         JqViiadp5DK5afquTMfQiuurd8jQQd2B5fUa35qoQlwQD4YLz1q59RhqCDnTwegpdKXA
         Xche88U+HmWeS4vWVn0VBv6Qtc0S8KDx9IJOQx5Jks8VPIrUHFKL0tf/qyVLLKrLSxdI
         C0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526360; x=1792131160;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIPd0Djbu8CBc4zLDdiv751Zy4DXleUy72RpLYJZ1zk=;
        b=D0R2gbCazkmZrEF3YiI2NFfPONGpgLw6qiyBtBET6D+PTZp56LkmMbSy4LdxghXsQ4
         FKujiWZfSx2NpxOt6Dq9V8AW+XKNaVLt+mQmp4TUmPR5+b0SlJbfVTbtFesFRjgi6rKs
         zhszzJjHdu41IJSTSa9O8lHvdh9qeXogrbJl38VmwDCn/Yh0ocg/GokaRqnX6n/VoRIq
         ToDOILj81JeNjYGKeawzFDuJfOI7B8SP0uHPAATUYuJhqUTWDmjSU3Y8/laP3DAHlWBk
         h+u0roKmVW9Xqk9PwcJCYyX2QDIpqXkLzXUWxffVsCDwYrf+0w/JxpYOlY4PZlrDKSld
         YdMQ==
X-Gm-Message-State: AFuF++ldo9E+K00YtZ5LFmts8nWo4Gb8JJVVE+/nqflIBPtg1gUXSmeg
	TeVS8dMsg7M0MvL4vewjUfPVk6RomJUTmkrardxiYvNvUO312zF4Ht2Fvdfi9cZ3Fvj4L3P2XIP
	ea/QVQ+dyjRFELoFDOZrXJcLhLNLH5XVRFBC5uNFPu9yH3eODMpAtdSi3ipYcjUQ38lwz
X-Gm-Gg: AYBFou3TOyKJ1WYj8C6lVaYg7vZGAxcButX06DjRdXUp2NtQNI6ePif68TmIYnowoKf
	Ew40sTBCUlijhuiO5mn2W//1G7f/3xrVD2mfi3AYD5EVqvWjOSJkCF7y0UJ+I6p3wHnR73i6aHw
	HgQNBkSMDxXzOAdQ7lD9ACyUFTY7uDicNAIO+Zp7iOOZI9OCX07wRGhxC48MdQYzp/dYr+AUBgm
	nQih8e6qYCTwx2H/zMN3vLWBmMf7FOeLfR6A21Lbv6+1Pz8Tte+F4km2SRlKCJt7EPTQYFOF7Pt
	ZbTa21IPC8uCTcceGDObd5gV2oUIhQYjhoBgcQd+IHAADqiYdhDQbPFSOcgFFXj19lnu/CxftdU
	PF5nAPS4I6fjT8aMBMLcJywKRAfoy
X-Received: by 2002:a05:7022:f50c:b0:151:2e62:fe54 with SMTP id a92af1059eb24-16a5ef287a7mr1102563c88.20.1791526359519;
        Thu, 08 Oct 2026 23:12:39 -0700 (PDT)
X-Received: by 2002:a05:7022:f50c:b0:151:2e62:fe54 with SMTP id a92af1059eb24-16a5ef287a7mr1102534c88.20.1791526358938;
        Thu, 08 Oct 2026 23:12:38 -0700 (PDT)
Received: from [10.219.57.162] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a3f6186fsm3562167c88.14.2026.10.08.23.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 23:12:38 -0700 (PDT)
Message-ID: <5022011a-c239-43f3-b8b5-73d6b5fa8e0f@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 11:42:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] dt-bindings: misc: qcom,fastrpc: deprecate
 qcom,nsessions
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
 <20260923-dup-sessions-v5-3-e953133a1827@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260923-dup-sessions-v5-3-e953133a1827@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfX+hH0Shql8W/R
 FT3X1eVl/Gbp5f1hSE4JYzfV17+M9NWeTsnosasFBCmLXlWkuyJ34ouPs/gCgbTzeKigoBGYFNg
 4Kuyq1QXqwn7w51wRy4JxvaUPCmOy0E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNCBTYWx0ZWRfX7m6mmRSuiw4f
 39REdX9/IXqDkASIoguBD8ty639f+kXiV86tJ0GSN3lVPxMnuP7PY75LuzyVl3hM3dHkyxxAFi4
 ahQ9F0tnH6zlF/cq5hsWlEyg9orHaLxeWlrgBfvH0pflBjiXwuMl1ezO5kKs6VNW5w+2VlBA8kO
 u5O2pFTK3Rwx6kqSDObjUqJ2CLJhsSlfs1GrsBZUHA0CdnuGGTM/q8dux9+tLnKjLKbxK68UyYf
 hvqbvuNlvfwHmqdPbwKVehUyU8SxN+uqrkaUmN/bTW2u0shfDQsYfuNP/KEYwJrutOMD6KIV4aX
 2GEsqWhcxDQ8vRB4ozCKuMp3yLSnltTCsF1etwIeecO3gJvaxsU0zFqK9x3pqo+RawuL9NB1DaH
 zDktfF3kgqGagzgtp3Np69hnzpi1W12dhH4E1wYTLy8nZE7EHq4+CdQfTvIizEGG+53HbHSXAz9
 XjEpqreQTtcYLQkhUDg==
X-Proofpoint-GUID: P4oK_UqalEMcO8-fjEYgCqD1ucGq2__-
X-Proofpoint-ORIG-GUID: P4oK_UqalEMcO8-fjEYgCqD1ucGq2__-
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac885d8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KkVOY3T2wTLdEB6rIlQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090024

On 23-09-2026 14:09, Vinayak Katoch wrote:
> The qcom,nsessions property was used to duplicate FastRPC sessions
> inline during context bank initialisation. Session duplication is now
> handled at the driver level, making this DT property redundant. Mark
> it deprecated.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
