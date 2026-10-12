Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6D636D9EB
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790908; cv=none; b=I3UbqZCgxjFxqDhrsHCwNlhVaw13VSUr6aqh3McFFlFg67hYtwbk6lbS+DGoXIPZyYe+xpcqH7hDuDHJ9LZATQWdwa9Y1bHFvuDV1Lc4CChZpmFyKfhQJ1evW4/RuT4r7j3tq0JYNKajMdfd9d+35yAmh3p/2739z0fc7KaXt7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790908; c=relaxed/simple;
	bh=T1k4tUuyUlsf0Br1aGw5MXFXIGvZ8ddR6/fF4iD6KHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wy5TsZZypaJ3IV8Yb/3OXEdHIacloIRhHpcz9HuKKu57UTBg+tnjm9psIlXdjN+AMZh7vSouD6yNdQNzf2pkjEY1WZMqwR6H8mOI9HXSiZn0zq7cjclkpRSiNU4qlmh/pKpnr3RoAwK6cpeIAfEyIg6n/vlWbm1cShfpIls98II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MAnubNxL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cble1kip; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MAnubNxL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cble1kip"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C569rr1002452
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Kup2LrkOjt/kWL0RBJ10nJ1bq30f7w7KzUsQkUZMTY=; b=MAnubNxLxV4EHkfe
	4xDz6THJMtqrIOoqXxFRBpqWphf0dCm685lrrwlVzeEyClyd0taBL8ue8G/PhyZm
	9cuE+aKpO+x06BLqODtjo0MWvfK9+bXoqaH3WQUtvZF65FIhx0WItilqfqNtci84
	7dQ8B3Cev+KOpzgpVgNElcbY85AymimtADxMQ44QFZMa3KIcZW512lMgauiFBwDH
	+u8SK8WNwfbBOI+1xo8Dl2PztwrKXokjoZZOJlpatl5hi1syF9wLXxvuPCxOog+m
	zxFpcPTMmXmGayTVEDqNKk0ZkyVZaLzYfJZZTOkP04MDkhPCUSD7rub3xWWMaq8i
	ESS3DA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkgv13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:41:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-533962f6bc9so3829501cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 00:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791790905; x=1792395705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Kup2LrkOjt/kWL0RBJ10nJ1bq30f7w7KzUsQkUZMTY=;
        b=Cble1kipDpWFBHraZax6TYMi1pK0mPJjRCI45QQJnRE5Vh2azTp09r1Bcsjezi0iTL
         XPg6uJBY6HUIptk/q9qxde9i7CVBA0Gsbquxa8JeJmhodR/8JzMM8go8yDXo7B+vdCax
         8jCAXuiBvRsawQ+xkAbIXWFqEM03/Rnl1G5gkhC95PukI0QQWSoLddCC3EyexFFNeHgh
         OVcQRpLd/VUc2X2TsiE8Bs5qs4AGxpufNJ8GGuiWvBf3I38HiTlaUGzLfKPrkY2bt4Kb
         zFSP0vSEtTnPmk2XzJkFjfDD+ZqHAQInfuOuBwYMQCmNhrROMLtbgavNqtXdHLp19SH3
         mYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790905; x=1792395705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Kup2LrkOjt/kWL0RBJ10nJ1bq30f7w7KzUsQkUZMTY=;
        b=XX3Im+fxFqU1O3zms6z3vD1rSvCcgukhcp4sVS+VMIvUlfqipJs/Javo4sRW+4f+Ym
         tSHU5PjOeiRkPwcEy7GRnxV26qtc1zIxD9lOHLG/ZnLefnmAG2JfkgWRaDBtu1kZeIy6
         +ea3a8kIEx1yvH7ppiHcS+WMTwb48X6XCFINWJxZcmcY7nLlPAgPlAez4GKlXyW+kb9m
         k6+bi/G4lUDRYG5++W5OQjojPMKgDqJKfd9ZaV9/r+DIkohRseTWqaay39RT2tgkjGLF
         AWYFvsaQA0BuRbnKIqvUyuRUammRQfc7ESG/tYg/Z/vzDdMeV/mDKhW78WWjyplq6003
         QiKg==
X-Forwarded-Encrypted: i=1; AKwUvBxA1OfPRSH/fzMQ6zAZr6TPGvjCd5T2ZCE3IxrQIUgMgLWSAXKWWWHshsp+oqQGt0wPRsR5PDnWczbqzewP@vger.kernel.org
X-Gm-Message-State: AFq9FYI99/vgjH45HuoPRUYksKFPmXFVBYTbkjJQ1755bwjz+6zICL3l
	i3nvtH2S7G/G0V3iMzKXK3aceehAb8TOn71NjA91/1UeyyP5U46GZtQ1o0a3+7tC6cpxDZaCwOT
	86cIhQzLxCtfstfb6DdVNAotAzYkJuSogN+DDATwOA23LxX3Tf9G/iqvi+Du9i6MiBJjR
X-Gm-Gg: AYBFou21KtKPnfj/qRjKX65ZlR5iFGOEEuvljJxd/hWzvIGAgPJ3HATpISqlrWLruWn
	9bYpjPZh3vqygfiTp6Sxb1FxuAst0WS1jj+paZoXHgzVrLz8oxWwgYI4GUVvAt9YJ2pGm2qx1YW
	uqJLa07ybG/NyHM48gD8tmg7QhfWaGo2Vv5xK5tAw004lPhF3fHoX7pf97p+H6y5lUwtlMtPKNn
	r4p58r0UXw1rLLKXTVmSFMTItcfweaaehEOwLf6ZzOWvJK0snJiejbsNpKpPx/S1igFk9fyT+d/
	oYOXXkbC1FyxSTuiYzjYQyk31l1YYHIcSyOdCkD9NDpykKSYTeiAKu3uODvhouKF4VZSxVvAgq4
	ocvBvdzZ7I+QBSd4ru8EmqA==
X-Received: by 2002:ac8:7f52:0:b0:535:1a83:1251 with SMTP id d75a77b69052e-5359fae166amr173329531cf.4.1791790905436;
        Mon, 12 Oct 2026 00:41:45 -0700 (PDT)
X-Received: by 2002:ac8:7f52:0:b0:535:1a83:1251 with SMTP id d75a77b69052e-5359fae166amr173329331cf.4.1791790905023;
        Mon, 12 Oct 2026 00:41:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ab4esm432818966b.29.2026.10.12.00.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:41:43 -0700 (PDT)
Message-ID: <45a2a77c-afcd-4dfc-89b0-4a17be1ff828@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:41:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: kaanapali-mtp: Enable USB headset
 and Type-C accessory mode
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-4-6faeac3a6d59@oss.qualcomm.com>
 <ytqzmngqzb2ear5ovqexrzcw63t7plac7hvsbh3ce32krt4mfd@e3yyzs6y5anq>
 <926167d5-e912-42b5-a040-be2bf220adbc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <926167d5-e912-42b5-a040-be2bf220adbc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMCBTYWx0ZWRfX0VrxMpllEeGo
 D2Ztx9XXYLkguA/XNlDkrPiSz4H8pRiF/cEOKC89axda6My77m2KH5hTTKCnDLRHRpcOjCOQhy2
 wRph1nHZGvBrhN1CFfTPuztaIW88rjBCaSIlPZWYO69DvF01DjEO0ea2U18AMo93EG/of2KwsTY
 +Frjxty7joFaSHZP5VEUJv52mdGk01EFBfytH02TsRx8ZQGql7QVjnP+TdDp/EBsxsCH+Rb+vkB
 4P7m9tCsfanyRYXXVvE41QjT+ZQqsiRoZt9UBJJG/ayDyAo8kQDZj5jZ8R6XgN0++HOAcfVkfDA
 FVkxVh7j+1KK1ZsvV9ZQKb6WuxfnqQ/6ZWetrLr3CJF6Gc2RT9UvlfplORA3IrLZCjLin4DCD0x
 dGUa8SBTXBZr6f1fzDm3BQPWrSVy8dR9+IASIaGQGpZCdPN0mP6MEmPDhAoDmKO05yMUrMZYKKa
 M24oCCWvjhKAIqlM2nQ==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acc8f3a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IFwgObqpU61r2iwUQtYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMCBTYWx0ZWRfX2p7iJMpWwElb
 kAQ2uZA4ebU41groiMWng8mfrEWLfQ2uAhhDXt1QEivhqUZjnC8U/sNJvFxK23t1QrcyVfkz+W7
 5g1AWUozCtEqyc6B6FHRWRKjC5jI4Jk=
X-Proofpoint-ORIG-GUID: UgORkmDLGiGvXzzbPBnjaGtvBfM3KGZX
X-Proofpoint-GUID: UgORkmDLGiGvXzzbPBnjaGtvBfM3KGZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120030

On 10/12/26 8:17 AM, Balaji Kalkonda wrote:
> 
> On 09-10-2026 02:04 pm, Dmitry Baryshkov wrote:
>> On Mon, Oct 05, 2026 at 12:54:29PM +0530, Balaji Kalkonda wrote:
>>> MTP does not have audio jack connected and relies on USB mux (WCD9395).
>>> Add necessary nodes for proper audio headset support along with USB
>>> Type-C accessory mode and orientation.
>>>
>>> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 51 ++++++++++++++++++++++++++++++
>>>  1 file changed, 51 insertions(+)
>>>
>>> @@ -916,6 +926,42 @@ &gpu_zap_shader {
>>>  	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
>>>  };
>>>  
>>> +&i2c3 {
>> No clock-frequency?
>>
>>> +	status = "okay";
>>> +
>>> +	wcd_usbss: typec-mux@e {
> 
> Hi Dmitry,
> 
> The default I2C bus frequency for i2c3 is 100 kHz as configured by the controller driver. That is sufficient for the WCD9395 USB Type‑C mux use case, so an explicit clock-frequency property is not needed here.

What if we change the driver to make the default 1 MHz tomorrow?

Konrad
