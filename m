Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79342483BFB
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993446; cv=none; b=kBdLp//1+zPWTBjoBhAI636EJ1kp9urfJBI6qxTMIk66GhWX1u6Gb6QER8YpwWAPiVYGd64mlCyBPMwAsPxKlZqgEwaDRWDXIAdBV+gSwhbYSKwAW+XbebWTgvhmI7mIDLyKyNWq3aAJ7x+sa10dJwz6sMVUtUTgYM0QaNyh6mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993446; c=relaxed/simple;
	bh=qCNMsx/uc/pNWm/YO7I0ZBuH71mQrPFF88Bz66g6IOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NERjL1LPlaDUx37J9sjkgCGYWa7/fW3ct7yQ4BPh+ieiB5smvVSUSLV5MtPCwGvmHqqZ1LTQ1IoYPf60Tkw8YBa3hV6eeOV92/qxn3WJky2dbVeFNT3G8Eo6GgF8cwVonH18Q2rUZI1JX9sUrnXU3ffV8Vi2nCS3Fi+NesJExno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoEWN8g4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HgP5QJbY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OoEWN8g4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HgP5QJbY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdvAc3818642
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2hX0nyMoB0pgtWjEs7TcbpdDDeGxZEojIwJqmRzxhTU=; b=OoEWN8g489Lgn8XX
	YKqdfKr5J3lRp+o07qYkvbnGt4e4z1pctTxnVUHD7KleCXYybvBeYa7gOv8Xf1E0
	jZhSBAncAKtCLT8Be/awroIpW5/VVKWjDnTdwKyl6TXoHPFZiNhF8DBModXdmfUW
	YQbQfRPRKKfm6tw5mtHtFZgW1b6dQK0JeuodOZ+isMqNbZu4DfXpD4vmr3bbM8+r
	bblD42HjvwR/D/APi8of1YGQm4coMgimUhtF/0XFKWtTvsziL8DjqpobFqVXiM69
	vI45JrXrNbWiE/9ppPGs5nBvrtsk85DBdmdh9P4iuuo/AAHW3cWKSmFYI/rFXLlN
	fSIkSg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq79akkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:24:04 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7d6767d06so93095e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789993444; x=1790598244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2hX0nyMoB0pgtWjEs7TcbpdDDeGxZEojIwJqmRzxhTU=;
        b=HgP5QJbY9OqAy/BGJCURG4X7C8WgpGyHHh2RifA+AQ7Zj/rLTdTUdXmVODy0cwaw7X
         OYOELV0620StSTt2adXo3gdiKdczjrKPUfyQUmirhNYUX2x0TZ0UqRIifROHGXG00SPN
         cSh4Kb9plHnsHdMXygcxClGhT+Th8BQPCVzVj/TRV/qhCu0sexPxNDJlAE2YdkUrZ/5z
         ipGkSTPkB2kGudQuw0oZ7dR0SiHjgx2WXG3Xh9DEo1u9VZ3kD3ltU8xxwTvLj+5AMFVO
         11AfAGev5qo0y1BmvIUEHDuiu2iIkmQaFK43MItBcRZG66ktDafI/ApwLheDIE/H0iqZ
         7/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993444; x=1790598244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2hX0nyMoB0pgtWjEs7TcbpdDDeGxZEojIwJqmRzxhTU=;
        b=t6XhOJXUYicjv3zm+7VJZPYFVd5YhrtvKq4eA8Dm7GXo3+shIBE9mQagE/VMCA8AMc
         vCnSo4Ex83c+7o0BP5JdkvwZBq7jQztzTQp54DvtepDgCQPua3Za7H6htcqgAus756J6
         VfEgO62Ww8P3tf3w7k1J550RySpAKviV/j9Yf5PfdH6D5ljHOjDY+wqE2JUdzj0mQCmI
         KGk4sHbcW2+noj44IO6b96PJ86N3ZJnt0Pbzxfxt72NANwhSONX77eypPa4Wi6DOUSfM
         SneP8EuGcDjcYQhpZ5I7/LOlxJI1t4RFn+eWBF0cPkQ0CYOHvEN984R6FmcaHyb1T4JK
         Afqw==
X-Gm-Message-State: AFuF++nOt906cRLZxt8a250ODW/gZQkHyphgjY4P7zgEQu9LltHTMy01
	OC6CpRBftbPjR3BBDqQ0eyuFINJVSkQ9En2ADLvAHHzQKnKu7X+BtEL0VtYPxlfFmCyaU0QSy7+
	IRpHCx93OtCQILPqvdmvlmO0Nqk1f3J2C7NX3YsBOiwzMNyZIW/q9gQ2rUfwaCCpSPQGq
X-Gm-Gg: AYBFou20pGbTt3HlRRYbCMsb6bdlUO7MRTklt7zmDUSYqcXY6qCilKGbL6aUsc0aajj
	uev8sv3CbrplvfYoQ2XvwmhTXwFLbLdvUehhP1HsU9K/GlROpup3dI6vspj1qvaKRPanoqumTJN
	3Qy5D52/GQJ60zC5EAjj5/te/9d+RMqf+ZuQhkmj6713k6odjMABm1b7+kAutHN+2fbqJv1m6ym
	Vj9UJLOzR5emVlLJNFDhg0XAjS2wo2uWckR1EuTMylczfyx8OCMYHvm7khbSq1kyB5D9wCctuq8
	OPer16t7LTzmEbywd2yByvYemRcmmf8D7btXOmZBJNqjZeHdccyseilNooBwVsisVyU47O3sqSw
	x6nbJNgMs1Wc0PrMRMQsWyw==
X-Received: by 2002:a05:6122:4a11:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5c9b8a53dc8mr3456246e0c.1.1789993443438;
        Mon, 21 Sep 2026 05:24:03 -0700 (PDT)
X-Received: by 2002:a05:6122:4a11:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5c9b8a53dc8mr3456214e0c.1.1789993442897;
        Mon, 21 Sep 2026 05:24:02 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c7961f4dsm1961105e87.68.2026.09.21.05.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:24:01 -0700 (PDT)
Message-ID: <579939eb-92b5-45a8-b782-8e79a4366a8e@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:23:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] platform: arm64: qcom-hamoa-ec: Switch fan profile
 based on power supply state
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-3-771abd65ee1a@oss.qualcomm.com>
 <cf04c613-ed91-4929-aaf6-421fe9bb7ab4@oss.qualcomm.com>
 <1612b46d-1291-4593-b24e-464ba2a180ed@oss.qualcomm.com>
 <872897af-6357-460e-9aa0-158eda22aa43@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <872897af-6357-460e-9aa0-158eda22aa43@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ab121e4 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gD9UIibj9IRekF7xquYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4MCBTYWx0ZWRfX7XgAotce8eEl
 A1Z0Cw1un1qHVxMP099t3trA01BJXmniW8g9972z94iuOkCWzwhuAWrufhf+UiZjgUjjvxcKDOB
 dx6iREUql84V0CbCSR3Td04LZ4aSXLk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4MCBTYWx0ZWRfXzcDSB81Ua43g
 qZGggtKuR8IsKHv/gwC7LhTBZlqKPR0QpnyiDxbPwih1ShyrEdsnERdiOJfgq8jykRDQysm1sKi
 tX3g0uOOUIxsOW2On457PnJ0KGnyQbXFDDXAqnINtHZCLb69++hw5gykkVfh6uMSvxwQmyQN5GK
 +S66HMVU2fbiVXIFDrrAc28b15x6uuqUzG3EPeUoiRG5asCIQ5oUJptKR0TY1Yk1nOPjke5W/0I
 e/OuArmoken23JFdR3f0X7c5+otxgbiTWEvi2XdIYr1I9lt7jgmzQJCPqDXcNWRnSoeOe8aqlc8
 e/U7vdjEzEOudo1oh1MpeXCt4uqOzzcCkF5HXlFpAwDsoAAUvBnUZu1RJvC3y2wog2smGvM5qvu
 PHMp+K9wJaTtRGJiJB8rwBvj2uW55C9WwBOQd3aqn50vsTC5/alAllqoKBBMThSTOryNpYIP6rV
 EvtMBp6n5d1l0yfc3xA==
X-Proofpoint-ORIG-GUID: EEtVaUyK1N4BBhIcdCp6bncp4xt2cWxZ
X-Proofpoint-GUID: EEtVaUyK1N4BBhIcdCp6bncp4xt2cWxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210180

On 8/19/26 7:19 AM, Anvesh Jain P wrote:
> 
> 
> On 7/30/2026 11:51 AM, Anvesh Jain P wrote:
>>> Is being on a (powerful) charger a prerequisite for entering this profile?
>>> Currently plugging in a 5W charger would trigger the switch as well.
>>>
>>> Should this instead be exposed as a fan profile for userspace?
>>>
>>> Konrad
>> Fair point — power_supply_is_system_supplied() only checks mains
>> presence, not charger wattage, so even a 5W charger triggers the "best
>> performance" profile. And exposing this via platform_profile instead of
>> an automatic AC/battery switch would let userspace make the call
>> instead. Will check on the feasibility of making this possible.
> Even at 5W we're still not battery-constrained, so best performance
> still makes sense, it's about wall power vs battery, not wattage. And I
> don't think userspace needs control over this either, it's just an
> automatic fan curve pick, not a performance setting users would want to
> tune themselves.

I believe fan profile control is very much within the expected
feature scope of a personal computer..

Konrad
