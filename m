Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB144FDE4D
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 16:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537828; cv=none; b=bKo7WqlIOEFiLMj6mmgZHKinqcT5mTXXYVI6L56FW+/JTU7HYIteQ9XeIgO6B0FT2rW8hT+DqtNxkNyqHGcCAScDx60vpQO9ob+1vt2rcwuZffHVsWiq+RPkbZPuyyUd9BYZyRhgQPIc4YJAswETx5+8JL+3WLkO2ozWBWE394k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537828; c=relaxed/simple;
	bh=6EMuGemNxkodLoVrJas21TkUtmgw/Ztd+5lOhHoZN80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NFUg3n3OGKdfV5K+kbsN8Mnl1QmU5JES4tJJEOd1LdIPn6x11UPqOLrdFyhfMU6dsXZgQFml+lwF4G3cUvmEy47ht7IclrxqT2p9Be4hgOl7S9a2VSvu8wpihEH/1pGcnCYAWq+kJ2jTzjMj7KnWd9kqoIKDKiws0GnAH+i1GaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gGIVfWl+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LGhy749a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gGIVfWl+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LGhy749a"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684Dglt33719495
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 16:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ubYpczf2GYl/yIKlMJT3YPKv2d7IuBc85zxyY8MBcf0=; b=gGIVfWl+IVBNqJxk
	KVKIXihnxH4Q6/zL/90Oy45L5JSb04b1GSjLmB1bE+vtZBwapNTWWJV6PEt6N0uU
	8dKz2ADKywrN6I/8IDAvi0jtZ6iXvL0a897tBN2+IEfSnrbI/8d1Erzjjt+hnu/V
	AWrBFdmvxunF+3xsqUhgkdWTRK6qdF2kjxYkfDko0KvWd8r+lNiuDnauIUnbWpOV
	EUU4RVZ8l5FEfqyegCmIUtu0rgEXnwlAv/em1uc+6meMhXKRwPTfk2zqtFJpLjvt
	FN4Cubbm/opSqg4YFHUOwr2RLiIwOMzeltyJWltXUmbXugC9iA9z5qO3jYls3aNu
	bQQB6g==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqd2tft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 16:03:45 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4e52682f0so1836112a34.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 09:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788537825; x=1789142625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ubYpczf2GYl/yIKlMJT3YPKv2d7IuBc85zxyY8MBcf0=;
        b=LGhy749aliA4kkUGG1KIKB4JF8OlLhm2fa0iLN0BeXPoG3GxzM+4MjdF6qQLltDEhF
         vfAH30Un0FwZULzflYHYtxbo4g+jZ3wQZPGuPB5tID3MQnf6nMjZJecPo8p93AQxYqZ0
         3UHeoIqetXVJXIw2y6+7hwTPoWtsgKMIbw42A05OepnHiXU3m2B8VkSX57oZLzrzEEuo
         GS0bQ6MAVpmR0GixdnxDYEsMRcDfd9CGogs5yGIJ/k2IKGOkODc2KZEeuao2++OsIRyW
         SJxv6G2GFEQPmiMRVRjW5vHjE5iXAuy2DVYixgQMzqmW9DS/M90JCtLFH6rYcsr1b27O
         S6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788537825; x=1789142625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ubYpczf2GYl/yIKlMJT3YPKv2d7IuBc85zxyY8MBcf0=;
        b=aHITaPL8R6hmbPuyh9rEFwjU7wCDwuQj7b94V0lIzOCIMJCezL5DszMdsKwcUci4iT
         Rike8wBtJOUe4695if87FEshOaazricz7LgW+5/a7pAykTwtj7xcmk4XMvybCGG4LUI0
         D9GUHmI9DW8eYqedrGbvw77JxUhckSYFKGP/XYH6RcOZymbFbebKTT/5g3Zh7uX7QZab
         xx8XBAom5/IFh3kKm8VqwjDZCoIAC8s55UoXLsDVXQKlWMZLVgrfJDC3vV+JiawqNIvw
         Yp+dTQZGa5BtoSpOc94lvfCUIGsserk+rVA1vKBkFHukBHGbfc5W0N4yw2o+Xm+AJGWb
         J+9Q==
X-Gm-Message-State: AFuF++mXwQnmgDjjPko4RFh1vr6Rm8deuPXboZyTVLy0jaKxRk7/r1a1
	WToC+viEPmb6xE8rrr5UgxWIbMdyRm5blT1zYJn8t5blN/LUdsW5IeYIBXSG1qx+wRO7d9sS9Jv
	bHtWgjEpvEUpx6FKwfBB6kd8p+Dp7ls860G7H/nBvSqPaUk25/fK6uyiJ/7wzRBpBVRMX
X-Gm-Gg: AYBFou2QiaBbbJHsZI8+gkZerifheSmuURUVX3pMemK1UFrCgUWxpYsSTvIV9sivgbh
	UgMqTkvs030XRWJxuD84rlPmDWxCDkK/NnrfbJmZ4MEMqbbw0qOIIAmPPeOP4rd6ethI213a7As
	SfKUN8O29G9QUlAn6KUO2G9um+ll0w7DEoCVRLonjAdU+AnVMoRYTeU/JTKxLmnurv1QuwXZcXQ
	PUv+lZUDreEbJStDOeyCAhmp5Q3KmoIDxwoQt08I+UUUIMfAT3Q1aIdwr3ycl1Oaxk9mBFiSfmo
	UVgGpPo+oLjfOqhhRqaY54HJsaWrWi1BqstBmDhvjLcbpa9iEKqbZ9SPPgba58X/Zhvh+pV6K6v
	M9Yv+kvYtNOKcg5s9WO07WP89qGOr
X-Received: by 2002:a05:6830:82e1:b0:7e9:dd7f:7a83 with SMTP id 46e09a7af769-7fa1b1e535amr5568055a34.0.1788537824559;
        Fri, 04 Sep 2026 09:03:44 -0700 (PDT)
X-Received: by 2002:a05:6830:82e1:b0:7e9:dd7f:7a83 with SMTP id 46e09a7af769-7fa1b1e535amr5567922a34.0.1788537823727;
        Fri, 04 Sep 2026 09:03:43 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.21])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6793f53sm3195659a34.6.2026.09.04.09.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 09:03:43 -0700 (PDT)
Message-ID: <65c956d1-eadf-4bdb-bd66-0530421fda0f@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 21:33:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
 <20260904-x1e-camss-csi2-phy-dtsi-v5-7-dc81d85b599d@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-7-dc81d85b599d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d6-2EMzEhFFzG9xmi-Rn8LtVuqoqthH9
X-Proofpoint-ORIG-GUID: d6-2EMzEhFFzG9xmi-Rn8LtVuqoqthH9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0NiBTYWx0ZWRfXw8EHpcbv4YpR
 DKDE5VAdaYL2OagmsQtDCg5aQBZc6ItSNBOalNJWk3UX0EfwxewI8kqq9kWsj3eHFMBqE9b6A87
 SNjrFraEFLrr5WpPqMlp9Xj7aNuKvHg=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=6a9aebe1 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=UQytLGTC8N96CC/hvWkJ6g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=sbdT_ZAiYm_QAtLiiUQA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0NiBTYWx0ZWRfX/YshrENF65Cm
 XlIpH67gW+PvnuOXZqEukxG756JFaiTXItoOpuLlamEkJ+y6rvoSebi1iriUYDf3tvZxC3cyW7l
 +p40TheWgaL3Vy8CbXv9AgytHLJd/fqo5laCqTi8O96YgNCq1XMFogLCseld+DFWx+45DZssgH2
 yRw7S8LI6Nnku6p7eEGhobL/QoynpbcwBAfRvAzdLZoBYfANXIhjCeMFgR80KqqX/cKrijnnWdr
 HwQ5EUWM+gBO4EJc98mYhmtBS/S/W0aGtIzTJWbQa/o6XE/SXmwPFGVTvIWyP/V6sQWFF1jeC5j
 2W14YemqZatp9aRi6bggyax5X/l+eK0YmOqIoZqiyN6k45z45gzSASrJOlOAGkSvTjwPHF5vcBg
 ObjJvopzo4nPhxYGcY+gM4p0LW1RwHDDyFd/FGD4C2KuBx3ykiDwBoCis9swENIyd7b0BUh3/BX
 OzPJpPIVlU8ke1cmiCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040146



On 04-09-2026 16:26, Bryan O'Donoghue wrote:
> +		port@3 {
> +			camss_csiphy4_inep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&csiphy4_out_ep>;
> +			};
Hi Bryan,

camss_csiphy4_inep has data-lanes = <0 1 2 3> and csiphy4_in_ep on the
same physical link has data-lanes = <1 2 3 4>.

Shouldn't both endpoints have the same lane numbering?

---
Regards,
Nihal Kumar Gupta
