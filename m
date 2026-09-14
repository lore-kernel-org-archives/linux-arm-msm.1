Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1AA44A3E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388920; cv=none; b=FUwcwgd1MqtqLm8+MOc6exMXOPqmOFeSe9M6ArRXe+r+R2n4++/uK8oRuhPbxejp16zy9bKW1dK+QbawW80X0e74gcXI8bya03tCQ/KyEV22Ef3PcDEE+y7QxGfUCqG/v/5D6c12TAyYa895vKJzftz63D0liR47El0OmjpMgwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388920; c=relaxed/simple;
	bh=9DL0kYRPp1aAw5C12Omv4zJnYSX+EN6BhsllZoa07R8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U45rS5vYH4LS0TfNWauUYt5yH6tVC6bZW0GUYmT+ZTk6gRmvPnnyViK+LJKK7oufqDXUspKOyStM6iV9riz/W3fWt8SIXMs1ojUZ9rrpBpqSNAe+czdiDP1O6Yu7tSA7x9qA4N9tvz3ZcIs/8rPcDZMMT/u/bwU8uJtO4LRGR4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gx00Yj/4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G83dsUP2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gx00Yj/4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G83dsUP2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm5EH1216233
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fVRiChZYr/F9P/d74sBkacRr5i+5ai6D7md1w2IZUxE=; b=gx00Yj/4lf1hk1vz
	h9pFIJ4+/ofDNTuy4hODEOHSAs/KJMJX33SPXRaP40ygaHLpNRsksyP27n+SC+T0
	tBt+HvPGd9CQwJMjZEAVn/uIGds749EM7cFFkYwhSJgcs6ptcEVKS1Ye2kyXOEds
	VXBMAnQHhVL/x02lu2NTgge5FFOxOl1PonEUv8S6JZOWdTqsCY6b8olmxzh6pcyY
	ijZQMgaeoNkpZGHDLrvbF8hgzbsYod7SD7VUhwAFsQrFGhc4LvzPNY9Ouj0qKDXm
	ayxWO0YBHNOa60QNaF/phesyH/ZJJd6viYqvRmIaYH0Sa+tIxT27jIE71aYgLnOm
	YvhVKQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0afdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:28:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93102454272so67608185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388918; x=1789993718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVRiChZYr/F9P/d74sBkacRr5i+5ai6D7md1w2IZUxE=;
        b=G83dsUP2LKYyw2Rf1h2hJni2cJ5VCfQP4XNgkSWM9EqTdePTuI5pjYs/3m1ph6V692
         tdIrm3Nhrm7gSpFBNW9yipJWZ6Po3+LoKnkixXzwUPpgbwlL3OQo6YYkwI+VmhaL6zqy
         f+MvJHH1Yxiszp5q3qQSXKB3hK32WbyeOcsnO0f27hhumIoJ55idtySurZVy3V9D6Mio
         t4fuAlKKJnwwqlaJVxATJUZYeGvxpbNTOV096yrk7wD+vsYTAiaBxpyDXDvnANxKK6kp
         D+Bqlc0mnghdn0zoMX1HVPUiRlpO6pF1BQQbymIQczQFyy8b45iU0abnhX1EgcC2Jv59
         lR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388918; x=1789993718;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVRiChZYr/F9P/d74sBkacRr5i+5ai6D7md1w2IZUxE=;
        b=gBWrlgDaYPu+3cYzj3Q08l4n3o8BIMMvrLlZIYhRWY8vmhWDwtpB2Tdk4fGnp+vQ7v
         5MBxkSHmGVA9FbTV+45Ef/NHOyKt7jvTXIGW87MVkBUqJ7sKugvMC+158vVhT26fupke
         WLS/xwzvMhdGJi/jKWRpumsmvQNghp/tM7sontPbz51rI4IlGBkWDrZdGvGE0t1JnbHz
         lVft9b6OfWiaik1XDg1srA4kRRDj1dxz8BRpkw/lbv/buxehAhjwvG9+cTSQ01FuzoCw
         i/d0H/cO0pE4pth68lndDLBZW8Kfm5OCQtLabAIKPkQRE8fbyEvF1fUzZcvJTo79YY3p
         8sMA==
X-Gm-Message-State: AFuF++mRrougeUfd6yIG6NsV7SobxYByDcHCQKQkinElVZMJRhuFXV3e
	o0iCT/T0H5Dg5YtiSjnClq5Otu0zNfiinflEWJtcknzsv035JW1NjiC/V6p0c7uPXHeIL4dDyAJ
	reyOLuWo02vYbEVq4DpKMx25ODAeEzl/hYkZGF525vNR9Ss5Kw37PK6WhZd76n7AR1hT6
X-Gm-Gg: AYBFou2azwpsHwwDR+kI8jl1iBxckEx1RcHg8G8Ln5dvZ9PpgbL5IbnxyQCKbG2ed1A
	CeLiQmvTe/K5Pq33q1anUQShariJgJ6KiWXSAgKAudGRS12Rt8q5gclfL1MUk46N8HrHNK1xyNE
	Ec3SO6AHsPXm9d5I2nPZOezZs7/N3vm77l4sey5Gq1PjR60DwWixFNEGghHZZyFEWyzEeiWR1Zt
	GVSr0oKYJ7kqNf/dSx+x47ykWP9+ajEa9vyZLDmFdA21rRdvCUXl1zmpXLmKewKYQo66W1i3sPm
	pGoueF8mz7aVL6jOAhhLvVKJPuKS4q1+RbXQ106QbNV4P5HR45XXnZiDEXeKUooCmziVCHKFZGS
	je5wrMy4VZUavPeTWRwbUKg==
X-Received: by 2002:a05:620a:288d:b0:939:e9a3:3105 with SMTP id af79cd13be357-93a29c7f55bmr259225085a.6.1789388917727;
        Mon, 14 Sep 2026 05:28:37 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:939:e9a3:3105 with SMTP id af79cd13be357-93a29c7f55bmr259221285a.6.1789388917344;
        Mon, 14 Sep 2026 05:28:37 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm425149666b.1.2026.09.14.05.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:28:36 -0700 (PDT)
Message-ID: <46ea46ab-5562-43df-a67e-876c5e1d2ec0@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:28:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/31] arm64: dts: qcom: sm4450: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-29-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-29-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX+9dDwB1jSOoI
 Ud5l2CLn3gUA957zNgU+Q5StQ+mMsAhNP1O4f1GPcUJNFoYDJaqhBwHiGNDiQ99sfN/mrrHgewO
 3h4NWUSeUEoER0FmL4JnJL5HU4C/BNk=
X-Proofpoint-GUID: LXZd0n_r28b8FNSRNgmPk46ZBQnkEGdw
X-Proofpoint-ORIG-GUID: LXZd0n_r28b8FNSRNgmPk46ZBQnkEGdw
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7e876 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Dm1D3uWegqzzbaKFt_AA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX3WjazCIbsTDi
 b975n+Gzvs1j1QHEmsRxmOd0+JHseV+wmoxwBI5/gOz5Yhwn1oaSmfTVxehxIgYA7iPhJiJOMOQ
 dQrxoCrHcbWWXyhW1eOJkMshqptbl6kKuvih0T4P+zZb7OZMqew0F9hUMFmz88cFk6d8Jb4MUIN
 6qOOFNKDRwJNTgv8xk/w30pn9x+aPn6Hk6O5zZzzbdMVi2IzEj12tQsvpxT3vrc8LfO3wiBRifZ
 9jvp9gXjq2uSLI54EASm2wq9jazUUv9JRR4u+//AEjf1Np6qusA1wPzhiS1dTQkF9hfq2nCYeDj
 ZLpXmiYpWvAjxzyvUtV6x7ucFfYDUMMLxtyqmsr1XpLDg1nHaxoz6olKhTMCcIRrp+hL5ckuWSK
 WMZ15FhWzHLJKGvUhtVi2YspNBS2xG2gfVrHIDZaoD09+fBzj7oYJkQqgozGQd4hCFGPR2afBXs
 PO8Un0QiYs3WPjMff8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 9:00 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
