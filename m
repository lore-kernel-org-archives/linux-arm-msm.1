Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776283A3E98
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 07:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786607120; cv=none; b=npi9Hb1Kl3/lXGu0oiAo2o2WwNp1FK4ajaDOFWDJmkROWZWQfAbpDA5GuQOZcWesCLJc9991hNXGy2ehmm0fKHtCn/CeC0Vuzwc2o+aaYG3ja0MfSEAxOuEMEg+Haas9Ya87RAODnGQ39k8xLqizjRvVnINbBBVXO/cf/hYoWN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786607120; c=relaxed/simple;
	bh=DHjJcIOsk7kODnQ5aTNimYaCYui07soqZWb23BPckLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=loZNstldKOOqqJu7kU+1ibawcZ4qTorKjvmLopyyCSs+RyuRLZ6xyzgAV49gyE1YTadt0ItCnj7QXi8fsUPi3+ACzFhdJm+9HQHnYuQnbgDAKJeGNjReWt4MFzQb98ayLhZTXT5iumGLiRzmC4De2MDPgL4bnUw48LX1mHAVEvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FPeaVwaZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRaQATDU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FPeaVwaZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRaQATDU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5gBVR1476799
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 07:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qx3EP7LJrDWwM9ZG7+f76byk7vIQMhbjIHopCD4jEHo=; b=FPeaVwaZH3jCLoS5
	dy0eX0Pb3zDAb+XwrpSQIH/ET7Kf8cU/fG19XeutIRCwHGUWYJWsgfvRvqF2zPKt
	shQg1naGOkYc4ds9j5LtGe1OhB7UlDXDA0Qj63WhCU5eq32qxaIq249b0fz5O9jK
	gEfOg62iM7LNgXl/ZnxD1ihTpKwDBQEMzbZveq8XfeQH3/ywlApAl2aNtvzON2of
	c0zqSfFx09E+wfpsT9237+I3P0ypZ4fWps5WUlaqf11uctg/F0uMBQOx6T8TXver
	Y5g2D8DdcSkrkLA8OGErq9crWmdpgeBSCQ3IbrF1hCglPudSsRMqLRS7zPwclIkL
	58V8Tw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0uts3gp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 07:45:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa3d9dfbso189454485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 00:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786607112; x=1787211912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qx3EP7LJrDWwM9ZG7+f76byk7vIQMhbjIHopCD4jEHo=;
        b=LRaQATDUJb+g8zw8sCp6xg06s2TpHjfVJHY0FEz+T/HmtMPDRULWIHizMVd8wl0Pew
         B669SIewqhM9jPd31PkxrOG5gkdr44PCNeaDBbLv/hMIVpuzNcQCziijO+qUhEHxY2cy
         mbzVyGlgTYYEMQ4tyq+d9/nuB7AKrQT/dtESmJBevMcN3CdYEGcbrlZj+QxcsIpf9DPy
         NxHzi19D4NihJnnGxDOhwI7ftiheGhzZo4oYJIQbAZGHLVI1ujMQZ8/yfrnLYOAzuULw
         osOIV7cin4uuCIWQMidOx3VU6Z1H2hnHJh2lFxVOPFG3eiQMKyGrhK7jyV0JaLj0uRpG
         t2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786607112; x=1787211912;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qx3EP7LJrDWwM9ZG7+f76byk7vIQMhbjIHopCD4jEHo=;
        b=ZoyELZyCiaMgL0S82Pe8co3PN4ecQQgSrBNNL2LfCvLt1nJgvqjMEd7UbtsTsPgCGo
         5hdjnnDY63MM3Q+E0mgbjp+RRqx41rpsCl0lnr6X4jekgH9eKptFBIiDstsrHDhdZJBk
         7UHmu51J/SCutUW7VhTDt+gsjFPIS1DRsfKTxgrUblvoWJ96Cap1QvJ7+LUOxsbdGQZp
         slQUcVkf2NrwIpJYoTfEYJe7lPtemv3rUS31pWNBxuJuMYidq9XC0/bq84Qaz3NGGtOl
         frjMucbd+W0i3iKgKrwppOBgtW1UzgnJzx9vSmCZ7rGBeo9gQX/2Rz+IADJE7aM6TXny
         nHnw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9KeRWceYwnnrv4GvV83dEc/aJBj5Uqr8xnFp+85aisTPwhaIaLlraQXo1Fk/AlooJMvthFy0d1HYbqpTp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf/r48pW5ZnbfhDZ37XuQotUrhqkWVSZgnJ0B0NJSArCU9/qjl
	cr7XN8J105LtBs6l04EAhvQXCmU1B+Rc95XqtVo82vyEI67jqUvfF8VFaNd8sDh7oRVhqTevQr0
	tNOgI88KWC2g3pDunql1k/qB/MZE0IdAYWRXYZDPLEB08DJCDPFM0WILDBcXMixhYTPBi
X-Gm-Gg: AR+sD13iFZagZaM6bkbng08cYZHd0kHUR/cAYKh0k7yphWyAKHlnAIin5aky2Tr+0q1
	I+vo8fSAeb6tO9ZTKjs5BbwpAGK2ce+dubC8qiYsikO5ZH0Rsrbq37VCFSEDd7YBqqwM24lKVbi
	d0kSV6cyppDBHtM7yDh1nv6xtYmm6E47BU2yViaWXokifbBMeuTOlP0xo0USMj4GUFkZ4VO2uU3
	SMj2AjoOU1oxx+UQV1AQ/AKi8A7c/GbvFlrUZREWZ7BVXgZLrVkmgDZUbKHmM2EM+bcVkh3Cpt7
	nRBC/ox3HZi1HyJz2Nh8M49g+7Tw41YJipv+kOmpi/rS/6vM0NsbGL1GgLMFsU8kZLBWMN9Wlg4
	HyRASGqf5jOyc+pKmEJBI7AofiNNoxOtmSb7btmV0y9pGuubwr/ykEnMHdi9Il8rO
X-Received: by 2002:ad4:4eee:0:b0:8f0:47b2:5736 with SMTP id 6a1803df08f44-90a80b3a0e8mr34463196d6.13.1786607112521;
        Thu, 13 Aug 2026 00:45:12 -0700 (PDT)
X-Received: by 2002:ad4:4eee:0:b0:8f0:47b2:5736 with SMTP id 6a1803df08f44-90a80b3a0e8mr34462516d6.13.1786607111959;
        Thu, 13 Aug 2026 00:45:11 -0700 (PDT)
Received: from [10.111.164.29] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a8179e4fasm9733956d6.2.2026.08.13.00.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 00:45:11 -0700 (PDT)
Message-ID: <4fff475e-dcce-4a1a-aa06-25d0694bd3eb@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 15:45:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <nqxbpcwxwastqutkfkaqz4o2telev3lixgrdlmb6anftpywjog@ibfxfb4e42xd>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <nqxbpcwxwastqutkfkaqz4o2telev3lixgrdlmb6anftpywjog@ibfxfb4e42xd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vTIFJP7WNtfPOyej-nw6IIjrPuRJIMdT
X-Authority-Analysis: v=2.4 cv=aPDAb79m c=1 sm=1 tr=0 ts=6a7d760e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0b-XH3JjkyDtS5VtSh0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: vTIFJP7WNtfPOyej-nw6IIjrPuRJIMdT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA1MiBTYWx0ZWRfX73RwIV7tfD3Z
 93YIRkGWELhYsvbmHpfuYO1iZZY4OG71jUOUvhDh2w6oPo/YDmsWqaPRFeRk107OkDZb6KW6f8A
 x0jM/nicfpUGezOWHLhApI8xAi2EmIY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA1MiBTYWx0ZWRfX4whDnsbhyBCO
 01kTQMRqRXTpRid3T6y91iTqxExMCc1JTAQPibaN255gimO+BOd1nUHBY8Wt8rbpfXgvmC5C3d0
 j0e0FAol3GnsEPAs/CN1oH+i+s+anXNQtGI6BmyXomil3belowJsHSmEXa90Ik+Xu6cTYD7IVQ1
 T4trsNH1hdMmDhB+OOPHxTnYlAnSlG8rf/WpjWTUztzzIa4DgC2kpXmFB3DQcOck4TvOHYmhkm5
 t+2rYpTLCRQciiLrAYM1ALoY7Ht1uBEYxnUj/ToRnVEzauPdRYV/0zRJ82guvXpnhkVNi6jQBXy
 jt3Ue4iJBoMieZXB8Iyhf4+hP9TjB4KmJ2vIiMMi/1U1zgP4sU+5Z7an9fWRlNC3b1TBnfPYpT0
 l2Kc6GcXA3ULzV4eqQlJsQ5ym9/k5hiikUWzROEcxPPs3Ws6Xge0NARukFXM4quSmaPlOh52pWR
 3PAIJafl6+gc+3i9mQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130052



On 7/22/2026 2:18 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 04:43:53PM +0800, Yongxing Mou wrote:
>> Kaanapali (SM8750) and Glymur use two display power domains.
>> CORE_GDSC powers the main display hardware while INT2_GDSC
>> powers a subset of SSPP blocks.
> 
> I see that INT2_GDSC is defined since SC8280XP / SM8450. Does it need to
> be enabled on all those platforms?
> 
No, INT2_GDSC was introduced starting from Kaanapali for SSPP1 
(VIG2/VIG3/DMA5). Prior to that, it was not actually used and 
essentially served as a placeholder.

Sorry for the confusion. Glymur does not require INT2_GDSC to be enabled 
either. I previously assumed it behaved the same way as Kaanapali, but 
that assumption was incorrect.
>>
>> Allow the MDSS bindings to describe both power domains and
>> their corresponding power-domain-names values.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/display/msm/mdss-common.yaml        |  3 ++-
>>   .../devicetree/bindings/display/msm/qcom,glymur-mdss.yaml   | 13 ++++++++++++-
>>   .../bindings/display/msm/qcom,kaanapali-mdss.yaml           | 13 ++++++++++++-
>>   3 files changed, 26 insertions(+), 3 deletions(-)
>>
> 

