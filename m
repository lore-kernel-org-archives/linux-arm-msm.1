Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45AA471422
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388868; cv=none; b=aKT7qMQWzIcPlBBTaWxJyLRx7bkw9rpuqTWjariTjdlOU8gzo6dExJwuLrVJSuTmcdvORAjnrBFx8q+eYNVwnkPyjZAfU1yVhOAdoMOFeohzEjL3a+/yS5FoVIb5kKZil/v3ZcliaAfeGe2us8ktK7djcvYcCoYqLq+NYWeFDT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388868; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tM1iwtx9kNZjC+tyZU3KY25sUT5kyFGnIRZwEM4WPBG7aEjfdEVFRK18T/TfFqbSuwkHXt5+u3QtBdcq9r9HI4ZxrG18Z4E3NA1oEeHkW2eocTMEHPZIAHg2iq5wbnUhevw5YnRavknND4zG6wRRNs9j3v15g/vNJ3oGMUJLmG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqYAtlnf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XR/HHADZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqYAtlnf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XR/HHADZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm6gH3793304
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=jqYAtlnf6v6d+eKP
	80uKAgparEQeqgBKuxMPK/F4Fo6O3Wzk4pacDYlRx7KJkWJ25leVo0s8/otxiiaa
	ZCrjK7km7HcEtsxbknIoBPvdMDqjjld6k8J6XTRDpuIs9L0kLEbjn6wa0ZYBzmJl
	6nWq7Hc8xotMOCy4TW9lbJv0b1mwN+dJENq8OsyGdJ2Mb+MkFbbCkBoZxaY58v9u
	b2fBrAj4Q5igD+HVs1VQk1h2JpEM3EnhbdPU9sVPqNymT8/i/p+iqnCLCfuEh2ga
	SJWriJYN0B5SD/KUPy68YjMEgxsnhPqjSWRhvq56FZ/lSRwrsFU6dyKa7l0VKesk
	IU8qpA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg13fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:27:45 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c83098d1e0so50464e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388864; x=1789993664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=XR/HHADZRqyssLV3qfdSX/TrKobxZcfTIaf+6Nyb7T5UUslaTJ8LZCxfkFcT/6ON6P
         trVLJoNUM5L77W5HU/jG8tImF7xZUUNcx0PUza+fluthhd11BGqjEKenLJhYvNnUJk3f
         lLCKOTUI4iac9WF8Of9jNlgOGy5wGMukxJ5cmzTLxzvKhjpNo7D2tt4ERBggD9UXDjbM
         OtLeB+ASf9laeNC5Pn5dclV9Eo+esd3FUJsVZjzUnPJkn0+wklgxfRB56kEkbX/6v5JK
         v4t5ruyKL+j4ZGSea92ZIsXLUqdjGl320JF/lj2HKm6AQ4R1j2FydpRm/inCwSv/+nXO
         Iq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388864; x=1789993664;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=DT8IZfdlfyh98CI/l2jzL0AWVHTV3qOfTSYPJjHgwjX5rKaIQ+T+tDBcYnh+gS+SbH
         W/vuUWbGzsm1qrb4W3HL48Go67vm8axyPzbTKWC3upPZNWPjT8NCu0vZCVIU/elPLf7n
         bGmx0+kJlU4aickTE24za1U8gapZ/K4gn4ny4nVi/9UDw8Np2FaGMpq+soJxALc32xpO
         5ojp2TAEXkHPBcLrw2cgwyOmP/rLZ6lBZJN46U3GOwwcItlAs/bxiAGApdIV1Lc8nVMX
         owKq+kfjW/VP79+oCAn5eKfK0ht6uLlVjKnevgP4mrrGQgeBW5mqweRNCJ3T7ZL+/EXK
         Baiw==
X-Gm-Message-State: AFuF++nEvUgLqn8vsRQ6ItG8S3HFXUXaU8932Zi3nL7+f+a/tjizArUC
	TPwHAuzKLWSoXRYhiViE8V6nLZTwAUlVbMLGElYzyzjnsUv+rC6t1PxfPmJskkR5B+kiMzNwXix
	qVwST7Vv3s2IIS/zGjhRUYtEE3z+QXciMM1SnHrXbuWHyxBX37HO/NQ3yoDotqXqbzRQF
X-Gm-Gg: AYBFou2L4vyyxYf5168phB2NNzPXBeTpODAvG6QKN5JQiPNuZNwoYqbjyS5Xl/TW9Uk
	v+mEPY27aGZp6Mi2cHzQRVzXsjjf8CcyUIMlBMSGj77tMvu7iJ7tKjwIQ7J2568YJsqJ6bMSWbY
	bCX6kvMgitl9osbpCsBrVdjgFPU9JfCjRZeAGus7b3k2ib/E0BI9HWXLw1i4wpfBdxKZksA0xYa
	vl00MME/qzNQPy3whCy81zUuX7YAm+HlVmd4HI9kkpe3ae6RzkN7S9NiBIDfNe+9/kpnXMYZDTt
	NH4OWLypOdJFmf/BHYH8rkiiIg1Ynva9/SnHnOA+ijpc+P2gzHHc6fvmOmpmEJV/EPLuboolAGv
	F8ExtEtauGoEAw8t32Onk5Q==
X-Received: by 2002:a05:6122:4a52:20b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c981ebdb36mr358386e0c.3.1789388864060;
        Mon, 14 Sep 2026 05:27:44 -0700 (PDT)
X-Received: by 2002:a05:6122:4a52:20b0:5c8:356d:c872 with SMTP id 71dfb90a1353d-5c981ebdb36mr358369e0c.3.1789388863619;
        Mon, 14 Sep 2026 05:27:43 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047aa12sm2432030e87.74.2026.09.14.05.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:27:42 -0700 (PDT)
Message-ID: <d6b04f9b-f51a-41bc-895c-f5fb5cee62fd@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:27:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/31] arm64: dts: qcom: msm8916: Add domain idle state
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
 <20260914-b4-idle-state-name-v1-23-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-23-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7e841 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: VmN-TH94Rh69T-AogQFR6y84sMnQDKD8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXzFK5yPyLdh3h
 jFMCyfCEhfKgOdXCb3oC2dW0KN5ZMxVGacfru8wIwM2sZKBoX7WerHyYIjYH7V2Lsmz2sF8YhdB
 UpIJlWiKXZZ9UYMvA4wGsjY1Ug6/oCA=
X-Proofpoint-GUID: VmN-TH94Rh69T-AogQFR6y84sMnQDKD8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX+hJM4vSkDm5X
 VWyALwbt8JeZ7rbIVmlY2kJYIf+yRgCc6wThiCDKsMeWYml8bBY7JFm0WxrKaUBBMAu9xVjhmH9
 VvSWFv2AIX5YacvH8yBrf1vbUbAMBEZUjG0E6249QV8xwtAlPb/NrLLyLjWxIG2utDDTZNHju/g
 8yOyZOQaMg6c4aYRDoZLRuniAbTrr0bvNlr8HtLTpsxg1x/5KMU/1PaMw9FzPpOQh4wd4wvfKmo
 PXNJplVo9JNCXiqJ061Rufo/QF/jVFAwY43gdlont7IS8QlEgg8a+sZy3U25dcGT8ZITgd+suw9
 Ebvaosu5pBiIQx80lNFAh4ivxyPvARXDZlGUKK16oKOrl9fW+IBhxi35Y30bn1KJXqcYRyT68sn
 zxtsy1kq0vUfWyO7KD8tCf/HluQoxO8BG3UVlsYSN3fsz5sEUFl1ZJfoAuKX5i66oTQm9Q4dOlc
 etMrtx0+E5XjLcJ1c9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
