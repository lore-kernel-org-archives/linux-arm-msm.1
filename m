Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF333769EC
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 07:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851809; cv=none; b=gTgsNiSUcoaYKK0wWbfAlbbkhN2ytLtvCVHhFUVBHiTWieX714xsJkngBwa7GhG88NcroxCBupnEZZPgXAkdAxKojxGwpFM/rgY4Zrm1UGzOp0KZKXVDcn7/Fcag0yDQ1Ye/ypm/Em9Pmx1p5qQ85L4130slSC26ukc5ql4yGRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851809; c=relaxed/simple;
	bh=K+hdO8YwXvoHzemyeTOvyXNZZ9I8D6Bcyg+siZx5aqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzY1e+KndC8JiKtGZ1HW/EAlTolSnChwOigOQRY5zRP7WpYEq6c+B12GOY/hIWachNcAWeZpW9pCj60ghDRr5Shb60PxWdCB4K/QmD/6pnlmy50qL7cfhGOpJH43lz+f8JDG/T6NMYB0BfnU36PRNp+hDTJZH1+blWnyjlpGZQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e1+wkkgi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eHjzZ6we; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e1+wkkgi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eHjzZ6we"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LdUN1477252
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 07:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q2Waas48tG26JkySLVN0ajTL
	Dsc6klnVI0Z2H492f5I=; b=e1+wkkgi3gpSEkCQ2/2tzYO3A4cRJ/mqHshaMCph
	R9LQlsu4y5f2aNbo+AsckJWWRT++vmg9PnM64cfq9Q5wroKDZPaN/wKBlXa2rT/6
	FhY72oBCHb67q7p/SexSuE1xFARj6VTO5EQY9eHhXHN2vbYc0Mlzq7EBMud5SyFA
	sHB8tNkiJMcE8ELkKElq2snXDFL5lMQkOuFeZuqg3M1XNWmyoYZVjXf17mepxHQ3
	RS46/NxRpdeiYaNeTv2CEFlmSF0GLxUwS4rwJ52hIH1mBvuZlcFob3AfmXdGVCaI
	YiNNuHYf/pxAgMyFflPn+wwAAWruSJZtPTpS8+87UoYmwg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjgpv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:16:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494cce712so745045985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 00:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851806; x=1789456606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q2Waas48tG26JkySLVN0ajTLDsc6klnVI0Z2H492f5I=;
        b=eHjzZ6we2/6gJhe2NEIMhmMSeFruTF+2PkUj7/JQJRJgMtQaQyiI4VxMK6QYdLmqS/
         2nJJQYW+FpXe1Y2nncBmUwxEcJlfQyUjJ5Eno03UFd+qGzDjpVRwVfleF4/iMYg/l/Y9
         0sv+MNbZvTKbKN+W7bBxczUKVMNuGKUPpa1mxj6QXZyCxkTurBiLRoi1G5DBPq1yauBM
         FxxVqc+GRvD0NFTQwvbxgrHtYmg8voWnwJTE3uOsLsyDJ5+wswhrpgdcOlgMtiLgtMjf
         WPszBqid+YCU1pSUcC4dfg6/Knf/9gS1FosG8LyAt49otHAXPy3s58GG8UDM7ZP1begk
         BZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851806; x=1789456606;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q2Waas48tG26JkySLVN0ajTLDsc6klnVI0Z2H492f5I=;
        b=Xfp8enNK60Dv4gHc4TQ3Baiiwn2pe8ZVeWWM+Lz1+KkkTfqvto3YVOnAJ1M7TCQS9x
         ZgMEehETeiZIyryko+IGYNIdAD+o2paNnDNeA7BsG1zvJAsyW/+BAQrm6ukvOs54H49C
         66O3vPFlxUqVYZBJHAk+CzvFKVjZ/YuNlBy1l4tB0NSM1qo9bCLGf0kvhwTeG5lotJ4e
         2E124lJPuVAuP2gnUxUXNxBHn1u4rCoBEviCER/9GWSyNa03oeXKxg7zzQ/SwKDSS82/
         /F/ybNVd2lNpW6o294MCqvdWCUs2naOoMAiX6ivhaG7oYYzhcg2xX+liX0wm+t5bPBTE
         lnEw==
X-Forwarded-Encrypted: i=1; AKwUvBxyC5MjV/wDLSlVFJw2na4WXS9BuJ/ArAEaS0kj/ryXCsibpPGa9kQm86uZTaeSPtLo6CqE+PeqJzUPLeV2@vger.kernel.org
X-Gm-Message-State: AFuF++mKHt/rJXbpfSbzSXwuEZGka0Qa50EUj5syIxyjsUmMGKp5uJon
	jAmuyFPkablti7E6Dnz/cOhYgN+twzZ3w8LrTNY1pVhG3tKhN8cXXGEZUgTSxiWx0uxNN5gbQCA
	r19Exq8i+9rgB3vK68PE012dcEaGD5YUVJcJLfs0QP+vE6cm+z4Ha5g/VV90h/hIQYgIu
X-Gm-Gg: AYBFou39JOP07LqKjB+53CjZcaSQ1/m92KFqM/GKYnoe5EBJIAzAfDE1alyNiIPNRNq
	llQhSbGK5lknTYTOdbG6tedYTp5C3G/6ejdMZjxB23IgV1nBRYdOZhCOquxDRlnsE1mSXzP3N5z
	KNB92olig8PlxeXQ8X3JSsO2uzvp/eHYpQtq8O1//Z2tPprvUtGNqRl18+FVf1lVmx5EoRevlN8
	LBeSd+9UDvnTwzxcdefYTAoWLs0o3/wV1gkt5G2cs4z9YoF73k5y5NPbRn2ZpzmIu6zVjLlwKpF
	2ufXAlFqAo977Th6yVGYjbZgL1779BQd0Hwl5QOah3ekfBxbwlZmwVdUT3M1RIbGQiLKGjzzPoD
	78grU1XTOVGI=
X-Received: by 2002:a05:620a:6494:b0:939:7b8f:f244 with SMTP id af79cd13be357-93980379a06mr3025285285a.14.1788851806186;
        Tue, 08 Sep 2026 00:16:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6494:b0:939:7b8f:f244 with SMTP id af79cd13be357-93980379a06mr3025278685a.14.1788851805448;
        Tue, 08 Sep 2026 00:16:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d057f4778sm268894755e9.8.2026.09.08.00.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:16:44 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:16:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v9 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LEDs
Message-ID: <sfdujw5phslyh4mornf4gii3tmlri64vrzh3atf3gar724dnmb@b7gwv6npuor7>
References: <20260907-pixel3-camera-v9-0-b1981f2d3291@ixit.cz>
 <20260907-pixel3-camera-v9-2-b1981f2d3291@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-pixel3-camera-v9-2-b1981f2d3291@ixit.cz>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfXxJxz2bdq0KkM
 +hq3hV+fm9B6HOq5xjoObp+2fim1e0EgmWO6PMmt4zdfZxdlUEeIRphv6TLSZHo6FEpTOUcbmli
 O3yqKZpLD6y9fR8ETdB8vE7CJsuPVac=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX5eUstZvAUChT
 LdLzFPFUHBq7BYCzVljXuflPRSZG6zBOrMWc8dEpZJJyKjUQENbfaSZQVWQKUduuTuSgb/+LZj4
 alRlUP8JgPpOH2XEvnksexccxwPLXR0nyadMOnaYIdS15xfQLOqMztymyDJJsWgr6lvu6cwsCTb
 lDg0iMwWSrZQJdBZJMQHpRBy5MxD2dW/ArGekp3GUxxCEs4+fQ+W9edLnI4J7I7O+sc+1d+fn6g
 BjnY+kFtIB9OUIP62enEQ/9w5dDjn3+Jc0tLebCKdeUAyEGBfB7ovbfqnIb+BvjqhBGf4vtMCxA
 Z03NWpMbKpwv9D+YePLzFj2JRSiWq2GDaG5pHW8sd+WNGzQkeJy6mM1jfMeG3YhcHm5t0XkTzX8
 PAgfHSSC6AZKWzVXa+QIxZKhHAw+34j2LmIro9HXdW+ukmrEmMQ/2T4f0uDVOeII2C/OmqEjzml
 SpdI3UJ5vLg3xTcI5uw==
X-Proofpoint-ORIG-GUID: HBr73AmCHe5tGYFxiKwV2vKYKuR6AT0R
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6a9fb65f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=TWkwOYXMJnNHLyErFSkA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: HBr73AmCHe5tGYFxiKwV2vKYKuR6AT0R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080074

On 26-09-07 17:58:10, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable the PMI8998 flash LED block and describe two white flash LEDs
> used for the rear camera.
> 
> Configure the LED in flash mode with hardware limits matching the
> original device configuration, including maximum current and timeout.
> 
> In contrary to downstream, we can control both LEDs separately.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
