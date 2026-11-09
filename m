Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236337;
	b=TN6QTsKl7ZoNh+uuocLb0mg3T4dqdYGjg+4BNe1Q6YNmYgiFXu1HwxeOolDaBat2vvQL
	 mrSB5g4+9n5zk1HT6aiz2WtkdGNEdIbipn2ekJzGRe9jELJZgACYc439DrxBDeuvnvLIZ
	 dbZ//aMCoZpymzU8KVVDLz+YfPiEG0xu0Jo+RBZ7cmiU+QrV02xxc/5FnLicn4HnYMMFi
	 Zs76Yd5R0oCG+vQt49r1B/49roHmkcteqIGGCiG1ZdUxr2ps4G4tYiWIhnWdMG1AHdOzl
	 a8+Jd6PWXiDUKJ7qp2QCGkZhkdCktsljZ/3kdhp1f8Qoy0qgovlwYAJTkCCT/DWkNnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236337;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/MZquHm/RGK7Y7M7S2aW6vNX6HrC30Io8G76SiD1+k0=;
	b=CnN3cffYfzAigkBypwVBGJxjl4u7HN34hh1MXdKXzaEpWvU8sywZIZ1fgjPLgqH76eLx
	 5MqWUx/SHAaUiCcpJCWJ+/3PxFNr4lUAbLoODO4YNKai/yIf280ETXkFv+6a9DLlk5Bps
	 ArOmLldTwcHeT0RU5AE3DUG9CT/EuK9RyyuJNpEB5b3GqOXCiAalhcwjP6iz4YUlEBRbX
	 3Vkjf5mzCCcKjtCA9dfWe6q0XRoA0M144CZ/ebtSUwK2wEJZbUdXX+g4Hn9pkSAQIxrGX
	 kpRV9+FRyAcJxkKryx55IMiJPzbxG4ZrGp/YRbORY+awtCCEMUG6glz05bDoEh8m85g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R+C2QlEK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="g6s3BW/F";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9868606A337
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9868606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R+C2QlEK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g6s3BW/F
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEvuj309693
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/MZquHm/RGK7Y7M7S2aW6vNX6HrC30Io8G76SiD1+k0=; b=R+C2QlEK9VGcFf4p
	58a26g4jAaa32792CJFhQb8IqHARy/QVORM0TxPGvaJ6kn6nILbgYwDZeo1v9KvP
	kPSWybTsUYfPd3b8iXmP8di1/dOi3hzLs+HdPswoe+9O7m3V2Hr3/bVYD3NqN5Yj
	tpDiyqSRceOM0+RUiki4G3RA7q9bLhCYXLQZkP+32LPhsbvdiO3iFeV2KID43Zr4
	r8JDLQ79dWC2HllJqCQuGXVb++JI59SKhIy2BTf/FHqpXwQloUfw9UHmOHE2eHG9
	6Ug03QE3cA+28jgcUW/XX+ua+9fHXCzetQYZ182rH35vhaQ0u2lAhctTUA7YqeY2
	l02rtw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucap8w7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:58:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea381ce04fso16217975ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794236335; x=1794841135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MZquHm/RGK7Y7M7S2aW6vNX6HrC30Io8G76SiD1+k0=;
        b=g6s3BW/FvPsq395nkp5IwnkINSTJ4UPzTNhQsU4j7OQIiAZ9EcYhcKK6aaJlpmPUOT
         eZEMdsXv3ySgIS1oo7T5hgycmn6m+061AqYAk4HZuhrYxsovBSngozhXzsEz1uAvBa5p
         TEtKyNuyEotxVWsu4rwiRda8ZoFOWh5qwHKqsSfsaRU3skHh8NYlMPjj/pnM98+junQ4
         j5gcGzv2ly6s48LcmWUxf4WH5UpZCGGDqwzl+/X43xGz1zZ9uFzrnSrp3lklAeVIJp+L
         63rsOiABgUZMrATGgZR8TJrlIrTdWuEDp9XV6YR9snLlNlbWxI2/Y54rsdxEG38YOzwc
         Yblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236335; x=1794841135;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MZquHm/RGK7Y7M7S2aW6vNX6HrC30Io8G76SiD1+k0=;
        b=PAhuiptG236+FJxwuNbyFXOYfTlokMG0cT2An+YvIDry3jjaRIKhL6/tx4PMlOXlqM
         uOhFOf/6BHy8TTDKJ9s/21Sq8c3pC+hyk3PynLtFOwBVtS3tYPuS10BE8SIpAXIYzUxz
         ZkNUoVnUO/Of9/1cAcl1srYsu6ZGZftVLr4vBw14CbZI7nGL6SI7JzHUMxVfGVJ/pu7e
         bZsaGpwlIaGl0sOgb6dzetmhto2FThVOVgIaf9/hN5yrQl929kWDdTxdgEqXlrn7cqWI
         Q/eccHDSRtLmNn6NgqTKZwn6NIn9O3q6lm7i1e8RiToxkwWKeOS3JD55jv3W27qf1u2R
         T5qg==
X-Forwarded-Encrypted: i=1; AL+hErHHFptCO9t3lD0ToXHIzuMr0WcsjCBhcuXqfPE0sX7WVUCTxWYL6apKJlXR7lXHmJOmGpTs5dH1gGe8mGbE@vger.kernel.org
X-Gm-Message-State: APuU4Z8r27mupvvfk8VscLwFZSsqcMTXXCtVUkMcfMBD6oWZULIAw5Vj
	ETv1dJF44yiCTTnudGMsmu28APjlzW3zN13x5xc0Ggm/Xwixt5luPNZAkadVXAl7l98e7EQmR4v
	jQjyv0pgUK9fm1GRXnyYT7U+2Wx9hvlwDtsUgsxfDgLiUBS06w0IkCaFmV8gC8HctvEKt
X-Gm-Gg: AYBFou0irvBGqw/7ACrGvYszx96hne6iHZEXLKyvGblBLaPDLBD1zeTu3uOn/MHCbHU
	itrK6VNJPuedPGEVZNHd4l5vOFXR/J1CNlPnFkv6XVniHyAOOqoYKeZExZUokm4HiAFyBvy3JtT
	fWFx/RJDPxIu8Zb0FkGHxzsjHcxl7ESq7UaVI8t13MVyfxpH3kmtQzeKzdKUgivhJ4TTiH4ENQL
	b1fJQg19yefdqyn/86ylnSa33pk+1mwCjyuw1aAjjEATYzWOXSF7AiDBjlvzfgqxRzIrPrVsmQ/
	i2cQd71ng9dtIfyrXFhF7uWe436FKKSlP5h1DY081gvmLIMKzZqq7Rj17HnrpbWCvond8xfy2uj
	5t/SqBGHwMGPZoEXig2R+RAeHmtmVYElIyqc7TbRZEoPl3hmPa6+UFhqoVaPP1i6+Aeh/BUXu1L
	We9yQy+2xtB7YrTTpuLAXJTQ==
X-Received: by 2002:a17:902:e5cb:b0:2e8:5857:b5f4 with SMTP id d9443c01a7336-2ed8373fcacmr31610975ad.10.1794236335438;
        Mon, 09 Nov 2026 06:58:55 -0800 (PST)
X-Received: by 2002:a17:902:e5cb:b0:2e8:5857:b5f4 with SMTP id d9443c01a7336-2ed8373fcacmr31610765ad.10.1794236334912;
        Mon, 09 Nov 2026 06:58:54 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed8174bdfdsm12236235ad.73.2026.11.09.06.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:58:54 -0800 (PST)
Message-ID: <c231a7b7-9036-4001-9ed2-e1c049f02dfd@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 07:58:52 -0700
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add per-device ACPI reset
To: xing1989093@163.com, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109110352.1621-1-xing1989093@163.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261109110352.1621-1-xing1989093@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfXxOf5huPd/f3Q
 BjruUBW8oKal5S6fok8Jd1vouMVBxf23f5gtLeNKcoyGjYx+o2Q+sOiFxxk+1f+3t2pkfb+ITSe
 3yE8+7/2Kl7Yh+AtSEK+mbu4LbhsEkUe40XrgcbJEpPZrcJG6vZh8t7QC6qjNUvfBm45+CkR7hu
 A+/+iNAnRQOP/sxWzbffKIqKTUo7ssCAVVNX6c3dI1JMhuN+hwmB/K5w/GyLSLMBNZgSD4+8ro4
 tfM9BqgWujj4jwK2PPJvifQJEGWdbZTwxsWBK/A95zxcQ38sg2YAj4ErT1bK4Mf3hISwA0HEuxZ
 OcqHf4yArx7GZqwZvanU14FjT9m7bF/FH5HUqIgAIb68pFfo172JPxNioF/TG95BXorYHVKO8W/
 +NIZF4OU+T3qPEzhnn7qjsrbCfcIg6uAJvu8mVnv9fBEeC7wX9xdc5txBLIkk994vl21vy3p9cF
 lp05nToo5Wym49+R+Lw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX8DW4HEjsRFkq
 3IPO9CFSVimSR7PTnXudfy3Vz5/fXOIqHLfB50jPKco/uBxGNZUl1I9OSKiVy4tIlFVh9rAw27o
 FlCf+2NgcPM7+Z3NYPzYKMnm/HkGg1M=
X-Proofpoint-ORIG-GUID: 2yBZ7YkNMEX7YTinawBzuLEg9qtcdj4A
X-Authority-Analysis: v=2.4 cv=TaQDJhQh c=1 sm=1 tr=0 ts=6af1dfb0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Byx-y9mGAAAA:8 a=pAXL01g2s4yJVYebQMEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 2yBZ7YkNMEX7YTinawBzuLEg9qtcdj4A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090059

On 11/9/2026 4:03 AM, xing1989093@163.com wrote:
> From: Hongxing Xu <xing1989093@163.com>
> 
> Writing the MHI SOC_RESET register is a device internal soft reset: it
> only asks the modem to restart itself, so it is useless once the device
> has stopped servicing MHI. 
Interesting. Where is this true?
Every MHI implementation I've looked at has the SOC_RESET register 
implemented as a direct hardware signal to the PMIC to reset the SOC. No 
firmware involvement.

-Jeff
