Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792581390;
	b=4EbNWuDJ3sFS0hokwnVaLkl5ib8tf36T+V1DoSBS0NSQTaaCJtb3TxE7X0wsL6NmHDav
	 +dD7eazmTdlJBPDBsQAm+3SmXDJ3mAai8QDUiIe8975GK6MRH3eW9+oTm5TGFgMfwPlTK
	 XclsHbTOLwhfTdh2RxgyXmfZNmH0N3/SrHHtmicH71785V7M1mgCOzN4Vg/loY1oIpvqR
	 E6mFzQARp/5gZmFlxrr3C/iz10QDe0g1Ik9u/ZcvEjYCQdBdrf2byWpl3pdVwL5HB11Ie
	 eFBb8+ZWw7B3JRrfXCIK/Tjaxu14izTE4Zz38aWRvWbgSzuOspVhG9+4rUqy1XZ1ztg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792581390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fkPmOzv3OgvoRDjNIIWJpFQ5aARxfWx4gdCqfd4sloY=;
	b=PmvDYAxHn2f1HEOIYqWlWdKfEIRMNyieG7CjzbouBPIgcRtxI3bCL1W166SzxXT2j+hx
	 swyLIEVDnb1MsUMOgbS1g5y60u5PeSxcHwFFHWJXIErdKImHMHF7kVj1COsFCcqhewpoP
	 0V7Zjy/+f1jWjTBPebdQRl7OPOH1HYn+Z/4puP/rKm3dh6Kk77ywlc6hkIZ0O7JsvRX8Q
	 SCwcP9Orzc3uzYFrnRS6kWFa0B+/jdyDC/CzXqu5zrldhMPQkmh9oO/RviBC+5mwuSTC1
	 LSOpQsC2qxoBPR1TvGa2oEbk7/3CT6NHzdhduNeFSUkW+ZvMzXqJEed7x21XDfQtoWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UlTyuTus;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxET5xM2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379DF606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 379DF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UlTyuTus;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jxET5xM2
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5YFH335095
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkPmOzv3OgvoRDjNIIWJpFQ5aARxfWx4gdCqfd4sloY=; b=UlTyuTuspJTbmMcH
	TbrdWoyGP9Fc4ksN8AP603nQ5JSMitl6SGjKkcJL6A1xjJ+RvA5CB4Buzq0FYP6P
	zO/EhRjitSuLTpqfPj/KiOqAZUouh1jnh2a29eP0ZMWFBaAfUiKryACuZmjToJdE
	2+FB8XRZmYUKQupgsJ4TenV8dLAldxr+Mj5TQc+aMatuvNZfCsWHVqAXWRAbxUrq
	1tyUC1rpg33NVSZeVbqngcKuycHB99rNqcs/FMRbujq5Lpmiwi7frL/ChtxIHlwz
	rZqPFNvYjnNBGfgNjsk2MeOWjCeJ55jUug1EkcHLLTRg1rh+JJLh+EjZb4kh2q7J
	fztWUA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj48ehu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:16:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so862619a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 04:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792581388; x=1793186188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkPmOzv3OgvoRDjNIIWJpFQ5aARxfWx4gdCqfd4sloY=;
        b=jxET5xM24qbiY2HOIF3FedDwxyS+BxFcKY/0NIe8Ym9BoGGJPshZ/DbK4DRqdGPu1G
         3rFCIC8G80yuRDLOtEz+4JJDy8Q75u2XsIUabeyAvqfZUbOYZJnKMKEi2YeD0PqYVfmv
         1oI2CmUsNd4l4Wh4g6kFFkLKBDJdnphHl0jSpDSZheqOWG64LwL6m9MR+8QeVZPWCORy
         weAq+ZMr3BaMYihwaAx3nwHmWm6o12CCJCNmT3g3dw9ZbQI0/SsdjzFiwYXoO0qa674E
         1lTKC4TgGEauTvpHcjJA9YXiEji6anqMPmEsZa5jlsw4wkOfoBOnA3dHagnZ5Oq7zE6q
         RK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792581388; x=1793186188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkPmOzv3OgvoRDjNIIWJpFQ5aARxfWx4gdCqfd4sloY=;
        b=JdArjKiTxEI1wWAl2iX43PD6mmipyq7UJD+gamZN4GAeDcWFOfZUjJRLUKiY4XJ5kS
         jaFDSUemb6HRyI4dKRknFyz7U/QFAi3ncKl95McC2R/IUpAqD1yAS/ksg1WUnsszI9GH
         uABuYZb1hDZYf29I55PYYBJSGtyQMSayrNYNRPzkM7n8+gcUK/zTuhtuT/0Rg7jZGkUo
         MFmFGLqXB1jNIb1NnvAlGnV2B146iH2u+RV7inbSN703Uikf4Ogm4cDMkE2DwL1uy6Ah
         jIPDJe4YiEsELVIjag/iWjpcBZ4s44y6ZxdKgJONQ0csKCnqQuFhlBYCGPM2rHSqTyfh
         /2HQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSx9SJYdkSJdad469tEw4mldIor+ymglgFvyWQJkjDWi9Vtc5Jks9aAvqdkO7Y0OmUUoQyKEK5UngQ+lfi@vger.kernel.org
X-Gm-Message-State: AFq9FYJfvyzJKMz5GV6vqhwuonyr40I1DzQT1GnXJwLLwP/0wiox03nC
	cuHQj5pSQ/CWCfAzgcHcaogVqfEUnbwJFTHHbDX32AiexJRNZcEOvOQGG4tvHmBCQC55cDNbswP
	S99CCVDUekTDL2Xhpg4MLd4dcFtNaPY7BzeDDeow753IYbc/dE9u0bAs0fN4h59RFhDo7
X-Gm-Gg: AYBFou09Isw7bA5chVpZqZFA6xnv+fDIjt/0wBRlc37D/wByAx99UVmcH+vtod9V1XU
	E1M8q1cOQNqzD8V12TJJTm3uViQUsoFCHqRoxcsUuP9yQtYB0wlmm0+2I+6O7UDTEzlQXpxLEr6
	3543tZaFex1Sqk5P4lMprTCyrgB13OD72Ip6fPHCUd42mp08Wezo1zC0p3D+V17dPpWNd9Dvh0M
	+h9kbxonYwy0KVojpe5EUZ9rAD299YebU0G5vVcLm0JUdruT/AeVUGtpnddDtRkdJC5qjxyC9PX
	5f+d8X5wc9SXSeu6uUO8Zts5DtSxMQLV9qa0M7mcv/icIRJLvvn94cGIyhv1eLNtRe/pbcWP71L
	uZcVEZKul5LhJqB4vZorBZNDbmsJL
X-Received: by 2002:a17:90b:55cd:b0:3ac:929d:ba5c with SMTP id 98e67ed59e1d1-3ad86f49b66mr1399603a91.45.1792581387610;
        Wed, 21 Oct 2026 04:16:27 -0700 (PDT)
X-Received: by 2002:a17:90b:55cd:b0:3ac:929d:ba5c with SMTP id 98e67ed59e1d1-3ad86f49b66mr1399567a91.45.1792581387068;
        Wed, 21 Oct 2026 04:16:27 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad80912f26sm3948228a91.1.2026.10.21.04.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:16:26 -0700 (PDT)
Message-ID: <425ddb41-cfd7-4032-8666-0193ab6b5819@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:46:17 +0530
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
Subject: Re: [PATCH v2 02/13] dt-bindings: display: msm: Document the Nord
 DiplayPort controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar
 <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-2-a2ab9af954d2@oss.qualcomm.com>
 <20261013-tangible-wakeful-swift-a38f8f@quoll>
 <20261013-honored-bear-of-cleaning-bd8108@quoll>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <20261013-honored-bear-of-cleaning-bd8108@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vNWZaa8EZfjDst1cQg_fKMgruL-z3iWH
X-Proofpoint-GUID: vNWZaa8EZfjDst1cQg_fKMgruL-z3iWH
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad89f0c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=D6Kic2Gw2dsiznywmRUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NCBTYWx0ZWRfX5TpWwlMTsBSU
 vlMlKpw08z/7EKbt8a8Pjs0sOAeX9t8XTsNsiJF6WRd+Dr1TajdlxSGxoFJMB9B3WMlge3MsCAx
 MhVPP07gMX9DQVXmyZ2hAUzh3ecz7ZE6m+pz3SSQ3BsOixV+AxFiqnBZ8Vf8BhnxgKpIIClkKSn
 d5r8eP3jrf5TkEqK4WFZ30CppYUpToWWQ8lzzDH+2SUYbXePjdJAIJAdXpRqp1Uva8B2Jp9l4tq
 nkMZnO8okr0RjRz016+mBDAYm4oM3k+XR6SX3pbKg6e4XMvXA+R2foxV6tUU3l0bOc/ksOshjdP
 xAmGPUXDKbLBhLqyQfexzf95aXp3ZAdwXoGoOshnuXd/I1+ng8W/DLmb4Rkxbwz6srAXoUhVdpi
 3YA5QSqO/xovfqGZnuCyyOsYQIc/8FfE8ZnxzgDiB5+9QfuX506/ytWlDrfJsFZyPUHTlZJvw4y
 0cn1hZUhluOilYkKyiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NCBTYWx0ZWRfX5vR1JDVqdetY
 iYDV3Ktr87AMzWIHrN5CiDYN7uJPHagZMElpuCOW3XePS67BmcFwBOHodVJIDyXS9a12KeB8gCQ
 sCzjjAw6sDlhAKfV5tBZvkDLVuqRM38=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210044


On 10/13/2026 2:18 PM, Krzysztof Kozlowski wrote:
> On Tue, Oct 13, 2026 at 09:44:15AM +0200, Krzysztof Kozlowski wrote:
>> On Mon, Oct 12, 2026 at 07:02:12PM +0530, Nabige Aala wrote:
>>> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>>
>>> Nord uses MDSS 12.1 with two independent DP controller instances,
>>> each exposing two DP cores at new IO offsets. None of the existing
>>> compatibles match this layout, so add qcom,nord-dp.
>>>
>>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> Do I understand correctly:
>> Device is fully compatible with qcom,sa8775p-dp, but a simple to fix
>> driver limitation is preventing compatibility?
>>
>> If so, let's fix the driver - just add more addresses to the
>> msm_dp_desc_sa8775p array?
> Or it does not matter, because top-level MDSS anyway cannot use
> compatibility?

For MDSS0, the DP register offsets are same to those used on SA8775P. 
However, the MDSS1 DP register offsets differ from SA8775P, and Nord 
also utilizes a different MDSS instance. Because of these differences, 
we introduced a separate compatible string for Nord.

Are you suggesting that Nord should reuse the "msm_dp_desc_sa8775p"?  
This would also pollute the sa8775p's desc table.

 From your perspective, what would be the preferred approach here?

>
> Best regards,
> Krzysztof
