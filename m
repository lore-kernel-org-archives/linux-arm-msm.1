Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598665;
	b=qDvXOIUcyJRdUWoIOUsW2VySYtjNPSvsdrasHNAVPEJWnI/tR8p7hyS50xZ5yrENuuWo
	 rc9zu4mg1h+Jq3GNFCOLm/QO1jDODxml1VQxZXkByO20s8xlPf+U+pZ4EvTpIhoglOHqe
	 FUH3MYu/qKFo5L8EMQZYS2VGngnYvRnVuq1a6HQ1QuWVMzmwZLIgfVN0ykH4koQT1ok0c
	 brRcLU3cwruEPUJZDRg7RqR2pWpUhwtsoaXzyQM0PWJacgElGw9ySVl2PUXTtWtMC8PFo
	 FeWlQCVYoI9IZ6xjhn8zkVJO/QYZr0w4julWmc70gR4HB96AQ/ArcJ+/+zGRE2LvkAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lGmW88CnQl9hiGYpiWfwaSM6NmzBZwZKuT4WR9HAtaY=;
	b=i+b2z5gewGQx9d2H9+RCxMcD4Gkmv9ffTZbmLS4oiQv5Q3nL6Sa16lD9fQmtIjeTzIGK
	 01FuzworXAiur33JSD9NUtHrBh2UGoICIHN+fRgGm1Pe9AP/yjvan4xafA6Xn60Aj2RPx
	 2HFq+ZYhVK4teFvjWtntqQTmjjBman0T0yzoLXq1Akyf1cCE22iVyqgKaJ46iT6A2HONR
	 rMNXZEch1tKzEmSkXiZTO9WkHM8H+P6fulE5r/IUF3hsFVYnD9BC1zDt3f9URZFrtkhzf
	 /k0NQQLdNsgvLpCVggjJvwuFYvAnUBrohMPS3mtHmaZ0VWtssbb7NSXS1dtGy4xTubQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=izRxgdwI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="H/1z8zyP";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672DB606A688
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 672DB606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=izRxgdwI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H/1z8zyP
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP69sXt1006327
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lGmW88CnQl9hiGYpiWfwaSM6
	NmzBZwZKuT4WR9HAtaY=; b=izRxgdwIaLNM3iHxISVTA7KguTx+kGEdEBtikRrK
	MhyFqFTUXmuohngSfhyjMQRqLV3C2Ov5posISQWNN5zezJZZL9hIGuIvVOROcp0l
	zbEfCI6lbThcjsG7ynObKk+W8dQiTQBCvMALhZkDTeD1hfv3VmbsehFvfmxY+b3Q
	l5zCWmHk2e+sjRBgXwvkQprmuFSpW2AF2TBjYqVLjrZajzE08FdFxardJOgfOOAu
	IGYFJjRZy6fnKC8qq9RU73BEPpDFgfeXq7PKqxHFE8VFVdnkkBD7JeGKcyZUth0C
	NcH3hNd7H9xDXPM9enm1j9DmL49pTBpjt6nDiPyB+/9ifQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa29fxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:24:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so4301159a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 01:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795598663; x=1796203463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lGmW88CnQl9hiGYpiWfwaSM6NmzBZwZKuT4WR9HAtaY=;
        b=H/1z8zyPwKf19jB4zZimqLWeS7jZx/NBhViUyj0b/kkF6tjxH5COr/MCH6AEGtBSs3
         xm/RirvVu2Dx2+Ahvk1mCR2WTkga1gL3KrQvcIWOhCldM/pZQ9+0jW2rxXnmxA7jbL7S
         rC/trXX3BsR48xSUYrhDhg9ORVKVDEgOCtj83FnvGD1txO7Zwo4ovNIBe7/6laEBkeiU
         LnUe8iXM0Elc1hOwbwqkHQHCY1UPYeFc4KP5F9aRK+tfcRzwTWtfwWhHkrwbguqBA2aY
         RSAs8XZhAo2ffKhA51N8nucr/RBwLcFmF0eidKCZ3jJHzLM8T9A6fbmZbZ2Az7+JD7G4
         pnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598663; x=1796203463;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lGmW88CnQl9hiGYpiWfwaSM6NmzBZwZKuT4WR9HAtaY=;
        b=LiiWt7IQY8afT9eeBDjboHaYh+SUpdyhIGc95nj3ohXsQItR9se3g/LccQ/rFmdYxe
         hDv16N7UjeDtKwfrt4BE0lJQwxtDNTo7lWj4dGeYBA2jPs89sIuuQuqWDk6CXc2knmx+
         u5WSZT4LhCBSpzAMU7jBcljlJ9nv0dRQqYsmYbHILyE3x9DfD7EKhC3K4RIeppeeyMbd
         s/8E9lchR1EvpFKZ7JzjQ9evmlBLt3Ce7NggmzLM4sKubX16EeLhjzea/rt2PiKAEqp/
         fgMiylDDSk4Obm6rv+1Y5g1xbCmZPVsJSkjxAAvPvXsqxLSGvVPjuIfw3WSGz4N5YizS
         1ccA==
X-Forwarded-Encrypted: i=1; AL+hErEeV9d4YwJ/Ihrzt033kzRr5sV/VVGwuZbWa4f9ouy14P4jWY1evHH52MxahhwiJVwgjUeprK0UOsiNMBFp@vger.kernel.org
X-Gm-Message-State: APuU4Z8g8zhwKApA+DEbRRGo8JaDqW5zjKWqfO0rtuPp5VDA/RHBlyfA
	CHBQg7Iq09Q6705krCK2iHHX/08ChBD5PwdiFZuP1xNl11zdCztRYYksplwusuy1ABYLVZA3OE6
	dDwVihTyh9z6vZRNegYKykRb3y0qgt4QXKlYl/FA1xphxXqDPUElrqxRTlu76EZqVUzRU
X-Gm-Gg: AZFdTZd39Rbdh3NNS3l3XD9hn8ZGzxbG/7+5MXJM+S1RKiDMQyBlJpzNuB3QEgXNb+R
	5g76IOWtfHAJqrJ6qHQF8HzIHB3JgtpkR/m9uWQIblTuZ/y1zUNX3GyuWQVcHi0i/ThzHQbPSQA
	RW4W6rD+aDSvPQSFleVS+gMjanYcNuWM1yPqloejkxCwNUJPWJOdlJGd3p2ZA8MATWsEX4Pj69P
	euzaU2NjhSnFiTGhucQ+OkSJvESZhqbG3YJBrqSaCxu0HKW5H06DVD5R85uZRZe7FKxCENH9ZNy
	AgI5gMLA6m6KHPMyEwcPoXoIuOl1RWJmnHEE9pK1I/qk+SCMoi3TuLhCi0oRhhM3RU4q5unEKPM
	GcaIY+pHD8r6ebqXP2Am5e6vn03Ukn5LJPSpjymYnu8gU6p9veZsvvBWMMoSyI8aEu+SCxkiVSz
	E=
X-Received: by 2002:a17:90b:4a48:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3b41c7b5fb3mr16297577a91.1.1795598662741;
        Wed, 25 Nov 2026 01:24:22 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3b41c7b5fb3mr16297542a91.1.1795598662124;
        Wed, 25 Nov 2026 01:24:22 -0800 (PST)
Received: from hu-raryan-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm27225013a91.2.2026.11.25.01.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:24:21 -0800 (PST)
Date: Wed, 25 Nov 2026 14:54:15 +0530
From: Raj Aryan <raj.aryan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] arm64: qcom: Add SMBLite charger support for PM4125
Message-ID: <awapP5FP902jwSJ+@hu-raryan-hyd.qualcomm.com>
References: <20261124-smblite-charger-for-pm4125-v1-0-2132c9f0601f@oss.qualcomm.com>
 <8dd3d211-d5c9-4a8a-8b48-04de60922b22@kernel.org>
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
In-Reply-To: <8dd3d211-d5c9-4a8a-8b48-04de60922b22@kernel.org>
X-Proofpoint-ORIG-GUID: DOM3JfC5Mp5WwHToLBtj1DR4wcS6z6ze
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfXyEXzxFcyFWhm
 phFQGxn/3B8ebUDhjo+oBNEYv8imkD5XL8UwVzxEPZJAhgqVL1tAHbA24ft4FCgGhKXLXueiA7t
 JWLHpdJbLvbbJiDkRGrDyHLmcn+xWpk=
X-Proofpoint-GUID: DOM3JfC5Mp5WwHToLBtj1DR4wcS6z6ze
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06a947 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=kZJHlUTYguviTMVrfrAA:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfX9RtAdMnLTHXk
 rcjMzeTPIXFqLa7Aj47IDB2OC0XIu8N6cb8Qi444L+ScY9dJBfvDbYZ7g/fdA/3a/YWPN670Afd
 62P5Uv1nE4cwp1hy5l3jRj85Dtlzi+8V10NnMK5Q79+1ZfD552n6XJCQpmfZsFzU8s7sNGLP3iR
 3EeplxqlInG2w9z+r8yXD2iwXfg9Xqs0DZkQaTr9VgvbMG4IDLuu2EqwvBNEkM43bYAfHyc0wVL
 Lcd4FFqFmcvfzW005o4AfOsfrN21N9Gof/PUu4NTq6RT+mr0l3Sh2zwMCaSez3e2dxEuI5fZ+Di
 Owo29koHLqjZwldXALZ3U5nVEP8cDsr+PkjaM8futDpgsi2vtbaDBKwWqpKyjm1rIRySR4Bq7yW
 WoqnOf7hHxUwMNubbFUAt5Ig0Y9ZKCJHV8KheQq08G3/ofCeecR6wS3dnosqUxjEdeHYo0+rEdw
 tx6xcEM1PZUwFWX5OiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250037

On Tue, Nov 24, 2026 at 10:48:02AM +0100, Krzysztof Kozlowski wrote:
> On 24/11/2026 10:15, Raj Aryan wrote:
> > The PM4125 PMIC, used on the Qualcomm CQ2390 platform (cocos),
> > integrates the SMBLite switch-mode battery charger IP. The existing
> > qcom_smbx charger driver only supports the SMB2 charger IP found on
> > PMI8998 and PM660, so PM4125 currently has no charger support at
> > all.
> > 
> > SMBLite is a reduced-feature variant of SMB2: it shares the same
> > SPMI bus and overall driver model, but uses a different register base
> > layout (five separate SPMI peripheral bases instead of a single base
> > with fixed offsets), a different battery-overvoltage status
> > register, SOC-based recharge instead of VBAT-based recharge, and a
> > different JEITA configuration sequence.
> > 
> > This series extends the existing qcom_smbx driver to support both chip
> > types side by side, selecting the correct register bases and handling
> > logic based on chip->type. This keeps a single driver and power-supply
> > class device covering both SMB2 and SMBLite hardware.
> > 
> 
> Why do you have unexplained/unlinked dependencies here? Why dependencies
> in the first place. Does it mean this is not reviewable?
>

The dependencies added are for charger type detection, without that our
driver wont show proper charger type i.e SDP, CDP, DCP. I apologise,
I will remove the dependecny in V2 and mention about it in cover letter.
 
> Best regards,
> Krzysztof

Thanks & Regards
Raj Aryan
