Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6C144AB64
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140835; cv=none; b=uqP0+DuDUBW00mNnJ+1ok/tGnHkL+RLqRApqLg5Krvn9tsx+EAVX2dLtk1nTEKhi/EmHAtaGHumIA48gm65N4PX4+V6LFe4mpi/ud4QvwQPNFTTAHqgA+7id9e53Gwx4NpcaBorJqEMRgdpx9Ew1FnXaHFB6OXy6mLQsf4hRIZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140835; c=relaxed/simple;
	bh=puwzqlb8XSUh1RPgd8HEwfS5QcUnz4musm6Bbo/cdhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P4byCMch2DVjFf52PtS6Jmfip/uid41p64WRV7rqUJD68yusp3pLVhrMn6J7RP8x6a3OyLAXp2BqQ4NcCmH2kCPMfZy9MXzie5US82O2/GbuESRm03mv76njxTzsh75bGNwmyW2ONZD5JJTJIRDau2cw4Iu4LIp5hY62FLBXWls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBLyguma; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INtn81F+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBLyguma";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INtn81F+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lImo1797650
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pkBaoAyAk6VOagpI3vxj7Dav0JCGHN9t4FtCKhfX2oo=; b=CBLygumaTboWfpqK
	gi75LdWvPi9jZFJIPy/2p9Kl8Z+4o5yB99e0ZiRIbJtgWFooRgY0zEb35yZmMgcu
	ATFuuFOMJuz/jGxJzF4O4n82BbYfMUHazGhG1TVBwa/NNFqVbFAf4kwXCKw/7f8B
	UJfGcEcuP7bxyqKpfHdwS3VV7pdMA792WFsMkzYd7JP7Sxpd8/hQb//ldYTxdLti
	scmTT1f6OeydJ4MEUjEEgGtSvRoe7/mJ18fSfpImzIpnzeXvKuz0qk3gM8dKfbox
	boxlxKUCzY/94CDhrdbQRO9I7tEnNMNx7xyB5Pau1IGtwr6SrMiUQmWNlC2Xtrb3
	0YtqJA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a89t2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:53:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338bd59032so15127871cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 01:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140831; x=1792745631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkBaoAyAk6VOagpI3vxj7Dav0JCGHN9t4FtCKhfX2oo=;
        b=INtn81F+EpFm24M1TrPklIL/IJU2p8jbKasi8+gvxGtvkoXe5U+dXE06vQoQDs9zT6
         7sP8XzS2EopJVHzW03mQWo1tQARysKKcPNCq02Vkd53wdX6RkI2I7UwzIGbgu9IqVLq8
         kiv82wjZFtGVHTLU52GZGY+Idot367YKNDzcTdAPndrdDSzWMzfme/3eYTaw1786Lyv1
         dxY0c/xEcmpyxgsfs1xtEBXIADGbN5BdioB65WMWN7qLM5W1X/1ItvROXIXkJ2x12yNh
         qI0dYW3xzz5n8OcAOeCVfs/l9cgDRqS0eO4BG4KdXXpZCaCJsgF+y0ESMvI7Xb0iSvFd
         TqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140831; x=1792745631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkBaoAyAk6VOagpI3vxj7Dav0JCGHN9t4FtCKhfX2oo=;
        b=1bwz6/9TG3pDKaly4JQYel0UqdstJPNPde+DYGX1GEtVw5TeJvs4XboAXkKUvP5qZI
         4zI5hmFNfqmZJgn91nu1r5NkF69vVdE0ao6kjvvdznma5VoZZwbNX9F9y9GsZ2Rcz7Bn
         1SBYbyLEv1s9KdFuxaDaC+VdALnL5PIwuKLnwCHdy25dlTW7vx3P5HBBBchmbyq/9IOo
         lnsC45IL+YsTKT5WywDDjG/kIb6a2cgByX6IiZRmRFt7bHJsiDRI+Fkj4QIIgXJdZj0v
         93Rj1XV/n0I1KEco71icopfF4MNZ0nc1zkd8DMG7I4Qvhh3v5RQZ5dmJ8MfKcS1vxxxf
         zbww==
X-Forwarded-Encrypted: i=1; AKwUvBzIKLwAMIXKVa3wjHFlpo9nrFPqhs9vZh8r22GHk8o4YAvKTHLDR27kwPWhykMsZx+lTuFJfz30oIP5viVf@vger.kernel.org
X-Gm-Message-State: AFq9FYICRs0jiuQJ6L3xspR9zGxhi4xWKsNCInHeMqraY8+yiP8l9cTP
	d8Ap34J5CNJuffdqETJp/4gJCXRbOld3bO+yKMt6o9MdikZBucgKk9f8Fj8Hg4lhuQTKDLLJkwt
	+JLL8fliOy0Jwxcx4XtaebzTaAW/2EBzw9CpIlF7sVuZ2BoN3qwVgsBK3RZKjVW2lKAc5
X-Gm-Gg: AYBFou3iFwhPyRtCxqFdRr7zsD8g1lme8wunyZ6iroXeAHhy9jErH9OE8jxsHObzUPi
	M01E/voObciUvYHe13WvfuSxy7EI7vRmps/6sdyjspMtuXPTdOzOrYelQYihLFLebD/eQIBohgB
	YuGM4JhWJRK/jPOmy+RJkX7lu2Qfk6heKE/vPX/ofRmla2bfGjTBwKr4rZR4YeZAr5AyZ18arWq
	6VNDBaqdwIQUkGyLKELr1QzwWWD4ONkEdeyZTdLcxWong8iZ3SIWZoRp83OejjbSZii8IVtIry5
	K3NNXs1RGHFMinReQBneUI8Fwo5f4X0DU1LTqNNFsDS794D3hb6WptxPiQnd4zhGrdv4p+hXTzu
	ZD5gCCemrLBlN8Bkpa2EHjw==
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr4019876985a.6.1792140830610;
        Fri, 16 Oct 2026 01:53:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr4019873685a.6.1792140830092;
        Fri, 16 Oct 2026 01:53:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1ea92asm648663a12.36.2026.10.16.01.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:53:49 -0700 (PDT)
Message-ID: <855a4603-f9ec-4887-89e5-c92a943212bc@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:53:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pmk8850: add PWM node
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261015194732.64428-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015194732.64428-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX3uh9FKCwXfJx
 pq556YdrBRXsFUE7xaCl5BD/mxQimnPbKPj9Uy4Q8L6UkFVcsSJEYkYIEv+eZr/vpckV5RkQINZ
 2EW2lKNMJQtpgPp5sxu+r61wS/emi7Y=
X-Proofpoint-ORIG-GUID: GdrjG4qIE30mXVkzIojINQnKubPVA1e9
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad1e61f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3cXBS7fYHA2BcZxrE1QA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfXxQNWoUzFWdeE
 jAYVOEUbXNN3exldtQeoA0g51IDa0TcVWDf7KDahA80Nzl3CjrgEIptyMzaABwhJkUlg+6ijKfe
 IuJuTFXy+AFKaovo5Z2tqkE8g9xSffz9uJyPSB3EWgN+1BcQ6PwynqdA5H5EipebwMDxE+xsHrY
 htTOkE0skEUWoXpT4N81BmHvIc+KO+vwRJKFQ3LMhJfqBmXdAuZHirAXmhtFuWXID7coPv7dQ/T
 1kpvmPlnq8hqC1ywaaf/hzz10y2fIFgkzR/lirZTv16Lrchmkcc1gm5C/bz9UpThlOb8e3kzLIC
 vY11UjFKiZ4pL4Sa2BmnuUS+11AtuC1Q9V9OcB9LzciyHY/W1jlJG4AxjvjXUbm+zxG1ORmQYS0
 9xdMd1i2xlICtUQCZ5WYkv8pogX7Vqq2MkGx66q8zorsg7MvOIeyVSinbx5N/4PmRPGwgxezkBQ
 NyAAmluAu2zZD+k7gvA==
X-Proofpoint-GUID: GdrjG4qIE30mXVkzIojINQnKubPVA1e9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035

On 10/15/26 9:47 PM, Srinivas Kandagatla wrote:
> Describe the LPG/PWM block on the PMK8850 sleep-clock PMIC. Left
> disabled at the SoC level; boards enable it and reference the channel
> that drives their backlight or LED.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
