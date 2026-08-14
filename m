Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB720311968
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693336; cv=none; b=LUZQUB+KPD4zCr/OIo/UKvzGt0fA3kJyotDYl33KXxavOM6ICveWaeVKEYpklSMuMR9Z7i0Nu94CD1+4awV7bYGQJOko47MH08wKNhDes6M4KiZ2Hqhspk0kQXHs7SkVRl4X6q83PB9x0vjgzhxwOzfks9osoYQ6ybmv+Dz1RHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693336; c=relaxed/simple;
	bh=XfQFoy92YAbJRszFj4tSxRJz3Ixlm75wjudJorUS+Nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hUxYkxNjeYGfCwoXJB2D9vU9M89Od3OystKWhXqrDmOrUE84KXAf/BJZ/d8p+fBgDe/2mFJVzEGw5LqFxB08YEF4eLgfBx6YcfonTxK/ck49TJYdUElELto1NjgobEn/1qPCToGLgCUZFbRvF18MLIqT7epPFem+CxXSa075Vs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLaB4z+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KjPDmf8X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLaB4z+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KjPDmf8X"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7fvaw274888
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fW099fw0HL1cZfejGLVIWP2o3DrM5IlB72+z3ftYlz4=; b=TLaB4z+QZfXwOQGg
	Cbtnvbf3oBaDekR0RbQ3A7rx1B3bXGq09su8+IOCAkdrdv1bb0bqc7Qak76tqPib
	eJBFZiq1xDRINkol4ZA8CNUotxcy4fDX9nij1mcfSMRkfqTHQD8LyEMQBelPwjN5
	tILZZv1kCzgzlI4OEm6VoJhgekXBT4w4yT7xH+4XCZFDH3DnL8LP6wXTwcuKxWrZ
	G8GSEZGQ/X0vlWwhO+7nxnBkzXHxjhSGACrh0EkFt0SU6Dd5BEOTsVNGiGzDYMBI
	bGNiySqZUhEeAjFGTQAWIIIs9L8iXOOfrt+j1nyI5H1awzmuCqHqJ1HRqB5X5oJa
	CfaCCw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1m42j93e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:42:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so10015875ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 00:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786693320; x=1787298120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fW099fw0HL1cZfejGLVIWP2o3DrM5IlB72+z3ftYlz4=;
        b=KjPDmf8Xcxn5/UM9Eg1Duke4d8s5R0q3gJiNXCADNUrSyW21eG1M4jeYzhT+U1jmJS
         XJO83Xs8gyyzJlF2ZvGAUie8SWHY2yVQvHH4qr/guqtnDoyePzalHEmW+kJuiAObzIM0
         geJVZRLKU7lv+11abtQ3tQ/KAkgngh9jiBf6xJCCh/GYMxX7Z+oxfp0C2JX1Q8PitQTZ
         0o3oVeHalalGeCJ0ojde2qOqkJKuTLWK/0GBbMXcqvcvFLYZi014SOez59OLmLp+5Uny
         9FiknsFzs2tuc2pxkcV/KtQOb0pJ/rr4kfWbUFwOKHzfQvoSeNqesoG1hu6VzEQ7K3uU
         J4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693320; x=1787298120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fW099fw0HL1cZfejGLVIWP2o3DrM5IlB72+z3ftYlz4=;
        b=duTUjc4c4CVu/I8SUq6gRC3uBkZpssXrE/Xp+0HsmeNMnkWtAFf9ubb+tYd6S80nuv
         PGfs49fpFLSlZzAztuqtFiOn6X3hk+u61oLpQ0i0zDqQsONOTuhM6xmdAw/fgrkcClZw
         k7+FrqbNBOvQkQigMMPn01FJ1jv0Z9vrkZLMkMDUaenjkQRVGzUh1jbRQcj5f32tKgjM
         mpbw8bAoa5P4x0dOGtOMlmTifNWBjVFxkHsnWcTzvhOtNB6ikbXGBd3gBbWEz6EYL4QY
         pJ2esreMZkYdIeLOMxSCOhIcm+cCYgCsHLinjORYsBBNu/fUeihVpGHWaXuSIAa1ugDh
         VpPA==
X-Forwarded-Encrypted: i=1; AHgh+RpVY/Ne4wHg0X+/bVIbm0KgIBmu4IH969Ul1dlxvzripUEJSMbsV5/8h+3cuLoXJYC+AJQjlY0emMLWajaM@vger.kernel.org
X-Gm-Message-State: AOJu0YxWlnx2ALIYEoF+5dN7P5g1WmOhLQG1CEv4s6ysyjPGCKIFcA7G
	XrHMTsbRvHad5JtlmSoZHUcc9Bw8NmGYh7lDytxzpw0cJ2S3KmOWjEQiUPShlkj8PWpKgCohbzE
	fJ9zx66j+bXP7eBaKEL2nFSi6w6hX7zx/arJUUwuhp7vd7J3Zi7QXtuQw4m8WNMvAbOV/
X-Gm-Gg: AR+sD12yCTW/YKGeS6WVKMX7WlTX94lh5QNYOq3An6zK5LlIaJ79tH7PdL+QD674KCU
	q79YhmM1f3zGxHsOMUNLhSEE+joy+M356ivixXuWc7LJHCXZ4AX4vvJlEadiRcT/smKpJheAS/o
	zKLg8Sz46ozVNDHqVEPbGOPE9odDGTPS/jP4H7moKsjGpqaiHmZKbzaY1k89Cb5e7hY8vTWizrh
	hZWXNMng8L7ZDXGWn/CihSNgZfq4pqApzt6B68b1zrSSFex6avvXyEsDr1hod7yPGwc4JoENUFW
	5B9afMPjo+4nkL3b62kKCFLHxOjtb/L2wRDqxlBVwDBtG6jkG3l2Qa87nbkXauENG8ZWqckSCrK
	q4A1h7V82kWim3jCyJ4770b+HKHAG+r0E6uMka0pDFaucY/akEfLE30yrPErqr29xvhQRCvMekk
	C+3fJBcKpDaX1RTn1NKe8=
X-Received: by 2002:a17:90b:3c8c:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-3933b91661emr4197332a91.11.1786693319747;
        Fri, 14 Aug 2026 00:41:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8c:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-3933b91661emr4197268a91.11.1786693319213;
        Fri, 14 Aug 2026 00:41:59 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea9a1301sm1542712a91.7.2026.08.14.00.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 00:41:58 -0700 (PDT)
Message-ID: <554fc371-f3cb-4c03-bb78-9fb5a06c2bc3@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:11:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] interconnect: qcom: Add Kuno interconnect provider
 driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-7-5e0ede4a0c72@oss.qualcomm.com>
 <anmbi_gXKslOw0bP@monoceros>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <anmbi_gXKslOw0bP@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I+dVgtgg c=1 sm=1 tr=0 ts=6a7ec6c8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qjwxEvNmO9gX62DwepMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: c7clZ7j0aB66WUAeZ54csfi9-yIM_w0i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX10mUaEptdZ2N
 bnwS5OaZ8f2Fg6D6oVL+8GJ+KTyBndie8g1Iv+3b5S7N0K9G+kZVivsxZvUVODhwdaR/OWhJFjI
 G6VcVqj1FSD16ipziQLZRHNe1JRUHwUIL6q7WF6q5NbKeimPNjOLpT68jDKfX8ZM8BvnvV13EXz
 A+MHw3Lj5uQRnvrtJ760RXJqduz/jF8ZVmRgOlahl3HZYXRJGvFdze4RJcubKXzNiItEThuHc1/
 WUiHOXYf31X2tSWMIpoqHoJY8haM5VhMKL4EaEEtk3LiO0qVO66RTk7FQ7eZHxsg5E+kolSwWSP
 3O8Vn7jNgVsn05cMCqyCoNu8ZGdGXSYU0eARXUpEQS6wa9T590DJvbL5RJIlquuXJ9gA3XJlUE1
 sKQ6RDCmrBuh30dLZjlCnRhwB6Xl3AFis1LhV1xGM+qSmmLx5efbEQRbQj7+Xx6brstFxrPp9oF
 QA8S9DFHWFzTW8ki5Rw==
X-Proofpoint-GUID: c7clZ7j0aB66WUAeZ54csfi9-yIM_w0i
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX0EF5TG7SJg/Z
 y/J5Ixqv8jbtrwT0VOpeDDlHF/3GZ8ykXAE/+zCWO82pUI8COoY7HMj2B2AuAfKB4ak5wSJV/IS
 EXAMtGPisIBOyRDy2RCNx5Z2twdspMM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140059


On 8/10/2026 3:07 PM, Uwe Kleine-König wrote:
> Hello,
>
> On Sun, Aug 09, 2026 at 12:57:06PM +0530, Hardeep Sharma wrote:
>> +#include <linux/device.h>
>> +#include <linux/interconnect.h>
>> +#include <linux/interconnect-provider.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
> Please rely on <linux/platform_device.h> to provide a definition for
> struct device_id and drop <linux/mod_devicetable.h>. The latter will go
> away soon.
>
> Best regards
> Uwe

Thanks for review.

Done in v2 : 
https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/

Best Wishes
Hardeep Sharma

