Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592573F6606
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787564737; cv=none; b=Tq8wD5GW/3luOwwqpAL/B6Q7VIQe8G4sIVaI7A7sMVWzsZotB4oixDK5b3r380o+d8IPTrp43srWmiePTUevTIYQfehn37QdoSQlFDVLHl22g9kdVklNxmZqDbEZrP5BT5URW2BUwTRMU87VpQ5+QozHiSIfOGrj+1vd57SyMHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787564737; c=relaxed/simple;
	bh=+I0hVqq58+Av9ARELy6h3GJ8Pu4OTaE2EFvDddip2NI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kV++mhJw2iv0mr0Bk6klmxK0AHnUZYSBc/0YHCpsM8o+DroCtsZZF2oEnfQ9idevNFuDAUN1Vy5C4DPPY4xEM+TSo+RYLX1O6C0Oo/n3Aw1PW7xIke0SDuj6SAMIb3n0iKp+rc1KD69YH+6gx3umqzodvljoOL2J6/5F0nqXgxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZnUIpHvt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOviqpCz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZnUIpHvt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOviqpCz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O9WNQ82035998
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SRbahC70zUyr2hoh+32xLig01tmnLKVH6/DZ7GOjUTA=; b=ZnUIpHvtMfJlN5Tw
	qXgJo1KEZsC8kYNLv3ep5kMFMvY3WrEecMXSP7tSC1W3E9kiRHsj7vwOO1qAKpU7
	Gn4ArPnSkfEPNC5kAqC0+HH3TfAr5UIOxy2gn8oeVQkMGPNOUb+xe0u4K1gLb/et
	lA++DmNPdG7qjrB1xcXIYpxunGvWitOYfcWoVJZY7H7HfP0b2wR5s3Flypct/lJI
	z1Uo6RhNmy0m5mKHoQbZzRrgjn/0gZxwQbZPYcw+qCOHcPlCZPuS8lnsCil13DYO
	Prw0Gb6jEKDZzCNkxzt+BqIJCBYPwwiDXwc/TITIS06AyxNfsLMWRApLt04bGJiz
	StX8YA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kdsg1hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:45:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ca37ce4c3so6022911cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 02:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787564731; x=1788169531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRbahC70zUyr2hoh+32xLig01tmnLKVH6/DZ7GOjUTA=;
        b=iOviqpCzYh8Lvna9RieM/bWRAfcLoVR3ZD573feuxZDUweKISSV8fH9SKoZgPHnbN8
         tIeY1GK4eqbunxrI/Nzbxl36zY9euQU10dvRAzEdarHMOzT0IF0G1JU2Qepn76UXVWtO
         AUGFPFxHQk+y+G6IUnjd7TAihZIKNBDzAoGcdFWn0AyIpb261aYba4lNkPAO1v8JhxHn
         NvByuon8SpVlp7dMG4LUnSfrhpPfj7at7tQq0Pqso3Vg/KiJy4HNhiwxrON/blwU6VAb
         ujhyRcMm2kxfnvuSNqH2Y9a/rjXorTUwBvZa7ADoAdqwX5pKAvn6A2yakapIWFvPLCYH
         wKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787564731; x=1788169531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRbahC70zUyr2hoh+32xLig01tmnLKVH6/DZ7GOjUTA=;
        b=FC1bLYqGZ+5nvAJX0liXyHHWx/fzZnAYu0xg+32xkzYVF4uHAHBs0bwXdzUitFbQ1s
         wbOdwA0OAtdPCkPdFZg4LkgcYcoBOF/g3GFi5pn/taBeVHpt2f6GY2hXVOM9CniReqeg
         tRbMK8vzA4CSA/vTZ5NznomajFQEiNVwmQyv2SNK9H51ywqSCBuu5BUhmFBJC4a6S6bU
         T6VoKg6e7AQLPUuqluxeEVr5dbyXSJoeREpakR4wjTPiw2RseuGXhbRJbJWjuOwP4TS8
         gT85+1aBBRxWW8Poi6P/hGlyY3WL4r1nZ38/XcHCyhSbcRsDBCZrKkVnPFg5GYrj5a/U
         AJbg==
X-Forwarded-Encrypted: i=1; AHgh+RrZtodcdZz2HEzgDDR2NkpZQOnX/Ud7Cwpf9L91hyhbygauKpjjTq/CrAakjj/e6rzS95SfTpheLlnAifUV@vger.kernel.org
X-Gm-Message-State: AFuF++mNx9UPPwjKCcR2wTMrrI7f3cVgFEqJEF5N/dWWGJ7hbOe7wpGE
	vda/IEi339WdbO08tkhbV+DkSqISYgJsvLTrBrv8JAuOVl0UGqqoKqHhBm/KdGhq5T/AeDdFX+n
	dJx2xYv050elQ4l/QocodcUhF1i/KVD7X7mQMV73Gi/5WQZI5ZbGvUU+ewn0vtfV88p5R
X-Gm-Gg: AR+sD1057ZHqWCY5PE8UlrJje/UXgqsw/iDXiAcCp2fgaKCL9/SAuW10WjbK4tGmq5R
	WcIfUKaobOEBhsvE5Q33ctAJyj5/3aTlKr2wkZ1gMn3jNgCGh74f4VSbHxXL8pbW/j1JFVMkxXl
	jabtHuJFZxPHt4jRl8hsl/+0zg+Cg3ASXfhpl6zS0rFuM5UGSZp8M3WD5X2trFBjuZMqkManhEQ
	/6uD+Oz4AzoKAiKlVZK4VwKnub9PITmPRRWZBOlrhFBmGdds3LSfu4ydKXDVx7npxTDlSspdCKW
	VxLx+NnHgME7+NjFAgrfbr9BrIBicgdzOWKgj9By+ObN0TRBGlfmx7hdH687Z7BAkIcaw0wOgo+
	r9ijXPxpS+Tu012Sz4c79pJqY
X-Received: by 2002:a05:622a:34e:b0:52b:4ec6:52c1 with SMTP id d75a77b69052e-52df59fbd50mr192865841cf.3.1787564730954;
        Mon, 24 Aug 2026 02:45:30 -0700 (PDT)
X-Received: by 2002:a05:622a:34e:b0:52b:4ec6:52c1 with SMTP id d75a77b69052e-52df59fbd50mr192865491cf.3.1787564730545;
        Mon, 24 Aug 2026 02:45:30 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ab63sm1152142566b.50.2026.08.24.02.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:45:29 -0700 (PDT)
Message-ID: <b68a12fb-e39b-43a9-91ef-f45db6d391cc@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:45:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: lemans-pmics: Enable PMIC MBG
 thermal monitor
To: Sachin Gupta <sachin.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <6a7ee538.797536ea.65c65.28c0@mx.google.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6a7ee538.797536ea.65c65.28c0@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfX9UEp+y9CVQIc
 a7Nkood6ZXq4WZ8Ep/KL8DCn+tIx8M0S6sLXbj424DBFpZhkBarxpHoxctxSKQwZ12KCpY+WWLa
 5dx2n8GC3d0XeATqmOM6r9BVFZSfJdU=
X-Proofpoint-ORIG-GUID: ZMPpH9WvgLaA3A5n4DHi_Ywtjo4gXPWt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4NCBTYWx0ZWRfXxm6IZw3xoMtx
 bPFGpk8pyl6vJG9iGonEt7/xE8mveArpP+R5Jdq7sePOxeamTaWlv0haCoHGIUwraP80PI3B5LX
 bZHAqUxA9rRQ2dUijRmULZ7F/nLaoiIcC5KEzKqODXE1SRLggVoPNn/Y1AkWMznwuPrwWMwqbHa
 CzulNtbieQ+TvNaerSsx+GDJ8/pXS7ry495JcNV3fUrj1+nm0JGOiipSVsBlpjm7a0I/Rh2fyKE
 4I42Z3G7RdssAn9GZ6T1+CfJS+Nq0v1ZpscVW8IK1yoTTtNVtUtmEhhSw8ixB4vBXR6TAfZCW2u
 WzRyhAudATG4KyE4y4kPgWwXz5PEnjfR1u7WfSjtJRjJLWd4Ut9Ah38acjU3/l9Lp+SOSokEIUo
 LX5jgu85J3ltrMKu+Q33nm2w0SW/H3rdb29GD1yc07B5a8UhMsg4PVtGXfBU3NomIGE+aGrAVpJ
 VuqMo1LMLBSaDxco/JA==
X-Proofpoint-GUID: ZMPpH9WvgLaA3A5n4DHi_Ywtjo4gXPWt
X-Authority-Analysis: v=2.4 cv=d8DFDxjE c=1 sm=1 tr=0 ts=6a8c12bb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YRSyWayBu2VEUMgi7_sA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240084

On 8/14/26 11:51 AM, Sachin Gupta wrote:
> Lemans boards use PM8654AU PMIC instances that expose MBG thermal monitor
> blocks handled by the existing qcom-spmi-mbg-tm driver.
> 
> Add MBG temperature-sensor nodes for the PMIC instances and wire them into
> dedicated thermal zones with passive trips, so PMIC die temperature
> monitoring is available through the thermal framework.
> 
> Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
