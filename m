Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C544F3ED3
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894236; cv=none; b=USuHp77m5vP8msUERsfB+PDlnDVUCJKdw+JnGw7kP+QbJVTDRjCO1jvNQFX4Ha9IVAkULklUFQjzwVu9qadmf2clSeaLXTerE3tjNUm3McEvgs5lpyk87PVrBWRqV+WGGDtMmFGxDkfIyM1wIvAPmMHJbTOKG3s9ZJnhB5DFB4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894236; c=relaxed/simple;
	bh=lDUZrXI4ageL/14i3JPc+1VGuvQ85xf8ByPYGgCshwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AT5fftoo058KgxFMnmaIFKqSK30MSdZSyFZ4lYRtDOmhfNMa8xojiguWIq1I6B1H4DLGtIv4YGT8MpUxqvsTsyp5E6PddvMmr2OjKxoYSO2NBLKiGhHhq4MIS/DFOM4KKwkog121UCBqNt68G0IJ+kzqf9t9XHG2BhfZEa5T1ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gX+0sRyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JSWT74YE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gX+0sRyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JSWT74YE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DBaUNA3209364
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CrlcQxNH4MH9uiduBnmx2EX5npg4ih1ZTI8/FTCX8UY=; b=gX+0sRywB6y2e78U
	E7iydsJL2KE2BYhKpEIouUPpyNNTmUa+Mf2yjwCmZjOjyXXILhALwtfpk089wHax
	EGaVSgvNB+uLzk42s5SNMj9ED5Afq54yVvu8Z8uIA/mM/cUNz7456KpDHTF3lkpa
	QoYUUvQbdGOXbq3HxB/u4fYNG96KA7U6XUt2Is21TpsTTmk5iE4GRGDsXsPeWQMa
	kfjuA1yH19bFRCfvrxCPyoTq95aIdm1EXnjx9ysSDxwh2ztE8Bcam4Ftmt0pM2t/
	h3Z2CBUJ75nzPYIvqKRG9llnCJH69bG2DxtckffaowMk7wrWWf/aLxTiwMGHT13y
	r86lAw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjhe87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:23:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e629c7b16so41504285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 05:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791894233; x=1792499033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CrlcQxNH4MH9uiduBnmx2EX5npg4ih1ZTI8/FTCX8UY=;
        b=JSWT74YEBc80Z6hqemDgfVjIH9tHdo0E8tq3hqjFqWcQTS4QqMXs67JnragmV5UxT/
         mpexCXSVXjlP64NzleWmabSGlTxp1mMgdYuCX7TbUVCn8P07mJp3tQdkvWrBZuOPR+FD
         RKT/EzmB3NuEcqS0njU3NnMVGJD/wVHvGFbxAnAohNB3rzJQqX5SPhjR8VFSjld8kkcl
         HU2z5Olo2zxgK1LXMcTsp/48Wu2tSvIUQGu3sGbm1cqG70NrhJ1glJKr4MfRw80o3Yvl
         WaJljtP2aHdXw8THD6OtuBSJxu6DYWpVEmEcx3YAkGz8dGIxuWfCuKJ76Mj7wiIlZlob
         DzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894233; x=1792499033;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrlcQxNH4MH9uiduBnmx2EX5npg4ih1ZTI8/FTCX8UY=;
        b=CTDK3rk1lHB7cGxRxb/bc7AUyFrdEMjtLXycjSRQfA/jSysHd8gQoMQx9tb0pLqUo5
         OzP2rgDHOeMiQOM4KgKy+PbBD8xhRQ592E4j2B7MArXESiqXpXLD9JcSb/22qsIUuJNp
         4eQiDGVZdxmQnaGjsKQzKqQDmz5T6fKQL3NmWy9JRmlc1nrxmj/TvO33SR4YZ/lpLlIT
         ofDbtGAhZCr9Hu9gX5ve+BTk0DLtD6JEFR1LzxoxeXnu4dS6RH2G4FRddfxo6z3AtNRl
         7fSlYpoPi0y+yenlcFRxVzgjBW2MNI1c1EK+Q7+m+ohTcofofGeQid0dvBtEDS8V87ZD
         jcUA==
X-Forwarded-Encrypted: i=1; AKwUvBxOV7E29xtA62tl2f43X9/ldX02MYEZlx5mbiY54eIcSxKMNZZutLTo0ObsbQ4O+4V6tIsP2zrMa8wVJKNI@vger.kernel.org
X-Gm-Message-State: AFq9FYIN1msT/Xc8BxBj27u+te5nax3yltIinOixa3hvWbCVIrITzjuW
	cma+QJLBygDt6Ya3EhA5NyBDlBrtKAnzeq+1THxduwYuDWmQEYkvevlFfaCdVHYHSBVLy/1SMyq
	YoD9Jtg2iEHE5UfM9fmCIA89pPzGknbyvDNtM2QVwdrdWbPLDpz0r5lVrwLAjFraZySlf
X-Gm-Gg: AYBFou0GniKWLe8JSDPgs3OWzztKPwZZEkDBtyf9fCXyrx9k11DtMDdZdBYxlKLN8kc
	AHQe5fjmj52be7UnJMU8mHkip6pr2DMRv+lW9NVRu1DGltaLatVGEU5ZohwFxGkHiPyFAhGul49
	bQYLGSErCm5YIJLoX0hiT09SBsgvzxAZRVDZHp1rm7rxbN6lf7Ei+D/wCYs4RqQ2iJnUeafyjZm
	lxzbBm2aaSrcvfj5KzmDF+174sfp95EAtshAHVWYyVlPynIuh/l9HW23sjTgIohtvnJ+Liz7Cru
	lFZ7Iuhw/8mKCdTpBnmD02QR4jNI8qUbazFEcWKoONMPUTMH5ydKg3QQwdcT6UX4vwzJb5WFCnF
	nNfWYjO9ulLAH47Gq79xbHg==
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr2307007285a.4.1791894232607;
        Tue, 13 Oct 2026 05:23:52 -0700 (PDT)
X-Received: by 2002:a05:620a:27d6:b0:92e:6485:f640 with SMTP id af79cd13be357-93ebd224118mr2307001985a.4.1791894232143;
        Tue, 13 Oct 2026 05:23:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm598078566b.74.2026.10.13.05.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 05:23:51 -0700 (PDT)
Message-ID: <4b630483-4699-4802-b036-fa4968c7032c@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:23:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: glymur-crd: Enable DMIC4 and DMIC5
 on CRD
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922101550.2216689-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922101550.2216689-1-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jBnrNd03YcFfKMujNxu9iKSVzqAza0MA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfX7QVxSl3LNuRz
 74ExM9hhYZlVBIkHrwooV5HggL1LhX/d7mh89b4yIvdsU3aGyCMZYiJICelQjUVU26rwTR8XTfJ
 Oyg4zXXdCxlWqgbmDjFXmO07xtMzVCzdLslS6QM/JE8qYa7NeH6WDgV7heRfZYS6hqrx0brwSJv
 CXT2wdys01dcK133K2ElnQi3VhuPipOPjIkolxGS9qrFAtSLL3qUBfo6nigwsjbujzGN+jNWyqs
 WaCmfAIraPY/ED/m/FY/PZwm61UeFaY1t2yOtABuAuWdfzm5Jjcz8O5AEiorsi5U+ooN5MHA2wt
 zLx7nNjl3uVC75IdAEyTueQ0uBrqyCo5SRsl2auA2qQ3jQZ1OfYCtWFGiC7YF7Ta9RH6ipja/HV
 R0vDoQJiT47UJmecOqQzyKOfgApvkzcVMuw4mNprF+P9qmjNe/zF8XxPoZTkBDWd83y03VCX3yd
 Uly/vwdOOiGigmGhfsw==
X-Proofpoint-ORIG-GUID: jBnrNd03YcFfKMujNxu9iKSVzqAza0MA
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace22d9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KGhTxkWfJfEZ3ort4-QA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfX3JYX4inmkVxx
 bVKmFsBAKLnV0v7VvAAlUVC0o2OJbOGaKlGypBj48yCdOq9K4NVmD6LtdAJMyPUh1dxyP6j8A/4
 M7o267I+Rjjp4/77CLZ21sCWS+7tAfw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130049

On 9/22/26 12:15 PM, Mohammad Rafi Shaik wrote:
> Add the LPASS LPI pinctrl state for the third DMIC clock line, which
> drives DMIC4 and DMIC5.
> 
> CRD has additional digital microphones connected to this clock line, so
> reference the new pinctrl state from the VA macro and route the
> microphone bias supply to DMIC4 and DMIC5 to make them usable.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
