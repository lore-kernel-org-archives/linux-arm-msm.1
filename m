Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2D14A091C
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820261; cv=none; b=d4b+QgrCAl2EVHTqXVG1PJYViBqCLa9sZWmIbROVY4jZViL5nFv6dd9bGKcG+l+mKXAYD7Ov8gvi6xT0H6fXrAurwJ8Y5KwcCuu3PuyiTAG5qYr6JyQogErv5UXBWsqQbPzZ4vImgdVMOXCz3FxCB0Zst5sxmai0PYUanQ3kJuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820261; c=relaxed/simple;
	bh=Elu2DUvxB4cGcjtKZawr81rvYGJthLEYsYyNE8ZKy7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iPtnBoLZn6Y2kGakh/8u+Hn/YXV3FHU1V3EK/iGzMBdi4K7D2qH1MKHa4g/I/sFH/jkQXdU06hIYpMNvvz3G9ZnREKkke/L3Nm8AB/rIctr6Jt8naLZKm8Dofr4scXJGrK4elNSu+fHOfxxg4QvWfZt6iLuu1cYO/6od1ckW56E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckuxGRwb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=McbP/dTg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckuxGRwb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="McbP/dTg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFernW3851210
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xELYLGb0jnmIxIf4Qmyj9hiIBGQ7G+MrqGgWqyJ++Mo=; b=ckuxGRwb/0vA0Dpp
	D+GNN9lboCoMTviY3HJ1TJb9OQEYn/SPgJ6CKXQbZjsCKKdr/rZ4GnYrCstp2qB1
	1sne0xAMOYeY/VacUz/CC42MW4ow7rJMb9K1ndurXNRsns1+2E4rPsVwj5uhDqzu
	1UH0MXOH1G/+Z5ZyJ5fIfGqr6QXfPAnjdUr0oAkpkCI+gKpRolR8lEowBtatvn5W
	A8lOdz2mcTrfezJhdvj+hFmOvvsiM9xFYtvR75sA1mJy++KZeUOzSitypl5A+rjk
	2Fprbqm4DCC8xE/OZwiYU1lx6vhPI1gkt6aQvDodlIXNk+/Yj+SIICED9cOVk+md
	zvnFbw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdr9h0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:50:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea8a9cfe6so21278785a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820257; x=1792425057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xELYLGb0jnmIxIf4Qmyj9hiIBGQ7G+MrqGgWqyJ++Mo=;
        b=McbP/dTg5wJv1SRdv1f/Zulbl48Ioq3COetra7ameWPRt+Tkhwd+xrecrR0XLXeGgd
         7IdykjQCVzrTUItWl48FQzV9NxkCgF2eei1bCY1qWEeNiuBhQhcuNrr/tPSqMZ7EUasN
         VzsQRZl60lWav39c8nFryezspNNRvA9FbEJAd1xZFavuY1z7ihjrzmRibggQWOiJm2Km
         Xz3vppQa+pvtaOcvdjzMHPpCeWjHmYV0PNm+yR/QMovGQIT7YIqQKv4Epjap/kBDi8/u
         PW01hMyK2uAUoEI0UQwFZCxOHQ+6kGOFHC6homGeWA2ic3ZmlGiu/euDvJlF8fX6mV8c
         nElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820257; x=1792425057;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xELYLGb0jnmIxIf4Qmyj9hiIBGQ7G+MrqGgWqyJ++Mo=;
        b=aSQ9p/sbUuaR/ZpQcSDXoK/UgMP25D5LnGIwsZ8hvfNLZmT4EDZ7kxN/W5jv60MoTc
         ApjwDJKs/BUv1Qg85ThvqtzlKtE5pEZW6CaDuu3WGls2VYbQU4Jzsqxq+qA5u9kVYviU
         jEDjFkq7t0x9O4HKKxXqWviP8HnKy2WqjkMx3xi0Wqqlt/uMBLw3DQyrvtcFxsk/XrWl
         It21nFd3wu/59LUelNc1IqvkRM1DMdTA111A53lQAlhjTZ94OnDt5d1aL1c/QFDmpQmX
         0qv5iosCFtqGWQN3ROIFVKg4anmHeNtC3GFF0ESmImTrLHMQYcQaRlMr+RQshBrXrCDl
         0v6Q==
X-Forwarded-Encrypted: i=1; AKwUvByXiSPIRTxYnLXO/JTv/QYNxzmM6Jg9s9ewMtLfsW8LwnDda0HFRsFdqEqpsRq+RkIDtx+XHSH8PTOSJ8bO@vger.kernel.org
X-Gm-Message-State: AFq9FYIjytA9wUYc16GZRnhxTC49E3qGZFBzT0UKnlNPNLvxOEpwGu5n
	GCedii8cdzCxrevJF3QyBAd/DmTtmZP3ErmrDwI5ouw1IlabZvNuPQnCNsH0ufgvUTLjulvYovL
	f5V3j37wxIrBhCKv7G5ovCwM5E60Q10WM7RheRHGaxQ8gEgx+uMGphCLXnnUPAlsGhtZv
X-Gm-Gg: AYBFou1BBpjCUVdbScUn6Jgq6Lh3QxhHMA5LBZqCrtHflueK8LHakekF60NI/Ej597n
	eL5dt4/2gQf8EwgjfMNY+UtJMqbATquLjr0DezTOkoazsSDT/fyyXOk1r/LvkXGFyKHnueWNL6V
	x6+jH0AK7q0Fak2Sy6U802N2+kxXX3uMtOVjmSOAe1G3yIfiDPTd6Gzvfqr39Jt3h1IVTI2sldi
	fngej77k225OYrKZ8mnwxM+FmD2Bi3V14njulUVg//7NF55bg3Yhf2HAVLtItY8QpjqVWEBdlNS
	rplceHlPP34B1T7olIr1c0UlfVNmiHfKkTewD+b9e/N2VKdAbPraQqtSzVsAhLstzbpakpxrzJf
	Wf3ULwVNL35k4RV+3VbOQ3g==
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr1720379285a.0.1791820257276;
        Mon, 12 Oct 2026 08:50:57 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:93e:508b:7800 with SMTP id af79cd13be357-93ebcd29970mr1720374785a.0.1791820256676;
        Mon, 12 Oct 2026 08:50:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1b3387932sm2043906a12.12.2026.10.12.08.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:50:55 -0700 (PDT)
Message-ID: <3a189e32-412a-43ec-9160-66acbf471983@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:50:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 31/38] arm: dts: qcom: msm8960: Properly indent subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <c0ec3d5de24b709ed6103897b9c78a555243dcd7.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c0ec3d5de24b709ed6103897b9c78a555243dcd7.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX8Zm0LTsJw7JV
 7oIKG610alSu+VKC0CiDWyihimUuH6oKROS3RMXncsnl495RqF01CjeFeBet1UPrUxEt+3SdLsv
 ivN6EHVsQgJwSuviNT060HrQ223AgIoYtEu4ILEYgdRGYEqJua/9Odwmb9YOPXkavjWV8FTNWdi
 DsFAiqtMxonHipnmWl1NkTjCqnEuaulBuY5YJXIWONbmvLxomaeEhPBV46oCB/uVO0St0G8mm99
 QY3D8r7jw+ENB78FoK0F3aHo7PxeeQkdCYUED0r+a5orm6wWmOUlW0dJON8Lgt7HhJZlkPadA3K
 //lhoP0IjrvaQm1XXCe+iTJ+ThdJ5NYd+QZK33kX9UZ6LFFLc757Yfp2CDdc4UgbzPu1q8IBYSH
 aUcFxVLWb/yQS9pQJuXVhRAQxFE1kfJ/SxEoBlpBvenh4g79jMibgisJsm0MbLl66eGU+zohJAM
 hn9qOqBIUfeowsQo6yA==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6acd01e2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX5R9R5SFVprqz
 cK9AvAVowTt/AvlFwL10J+Hz/mHBorIg65oYPpijc9tJmd5Zau+KbvCsff+8wcmcbry/4vLnhg9
 8BfikPPzGyvOVN7274UGQO05mGCQ0bA=
X-Proofpoint-ORIG-GUID: AOf2_DQucpTlsLAO--R5IFkwMUxv7syo
X-Proofpoint-GUID: AOf2_DQucpTlsLAO--R5IFkwMUxv7syo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Subnodes should be indented with tabs only. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
