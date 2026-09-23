Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651634F93AA
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167733; cv=none; b=dhUVA/wIhIjC7LNe/coJgLfXHJAzczZwuisUVo6OL6I4EKooJ8lTOiTff6QK7zqn5kTLflx0cOiSf7PHQQzPcnoaKCx2EctYd3Er0jb53YcHlFdA9m0qHQIg8uT6BaIUGXUBQFg7bUUftbM2kIt+OOyvwGqLnyScXjegiK6GvjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167733; c=relaxed/simple;
	bh=UqvzQZF+a+YBDiE3dPxoSY4txFf1GjSNRE0yqZqWl5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgIPxy/dflvQ8LNFF9FcfWdj9r+qF7kTeHfxbg1+7pCVwAqiHXcPovHIEIBkmdb87FCm4g87iUQC3mojxzS6ucXRTWUNZpPCyujudGAXs4Y74NJL7ro5rzahkLJHCrbi8EhsjVEFk2vP6+RcIErwOF2cOYqeFkMsOcF5L26Jv7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+4AJWdi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bWC34EaL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+4AJWdi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bWC34EaL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbVBf3027964
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:48:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+fYsmaCOswGfXIcjuZ4YVs1Tv5hzJto3q+rRnzlZDec=; b=L+4AJWdioG+c+ta7
	YIeFC+C6VwsQVYQKlFICre85GROY41erDMA6dTGiXamvlCxpI+G324jr8n5zFgjw
	VkD432rX0+In0NDhkj8nc8bs/QkW6z/Dg5YGMAIqHouM51bUpREE+H7Rx6u8yg6I
	FYLckwljTE7bIM9SBSn7UBRopE/2qgUu7j8Uk7aml0HcEJCq7NzZu50yM6ufl+fV
	z2uAVQyaFSHIHiyqHQBVMBS6CbpXSDj+Xqkd63HsiYrOOhiHkIeWVeVfc5NQyZCH
	GiKJm/+41f6/tOQ24+rqwf0gA4A05hSc/GMsYAyz76wOqeRrbVTBCo/ZFOygStmT
	MKxbLA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwarv09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:48:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91202bb99d1so223956d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 05:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790167731; x=1790772531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fYsmaCOswGfXIcjuZ4YVs1Tv5hzJto3q+rRnzlZDec=;
        b=bWC34EaLJ2F7ASZVzD2Vgl4LDktyDlKv6wBps81n0KkUVDp+UA865idKpjVncmrE4o
         f0Lc54gY96SyT6Y5HxZSIVb2eAzqww+kznQh4HM0PCh9UkK5FniOF3Gs1ZQVLSsts5cg
         guys/TMcya86h3NuQmH2Gl/F7STltEWEJicRKJZQE6lmr3cI1TI0VnwV3FU5NKLjNNPc
         tMZ86GeDe6aTtkrsXBHfz8ojHB36F3jK4aM6wQN2ScYBT1HrY0xtwDS/8xNzLmag/E9O
         gSALlgRK3/Z7SGydJQSOneNn9dlhN/xvs3OJAySMkOKs4Qy0qPh1g6Tvy/il0606IaNA
         WpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167731; x=1790772531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+fYsmaCOswGfXIcjuZ4YVs1Tv5hzJto3q+rRnzlZDec=;
        b=IQVrGx6nsKXpuPhh92qeJuUBDcwB9CbQQya+4SKhNRnSN0fF8MhPfYqoBJr2fu8LnS
         QLM90Eqn6PLo8XJjjLyRG7d7SPwOs4zu6MYLjO2s4ZWgnQKtCZULxe8qjASBLf1ZRBxw
         S2XGzKIXM03iNmDDXzjkmg3k6ijRZq29C1SON+nm1GP7PrB/sw5a9h+r9L9KFjgUmsFA
         0+RnHPJMJfsAFyp31UiMo9MoS/qOmkgGwIX8+CNNBxYsUf5Vka9jWT41zcSrfkc0T9Jr
         ckHSkB7nXc1RuHmj7RzaA3PsIatrD6ZvX95fbVwNaDQ8OdmqdyLNWqMmfVlmiRwqJn7q
         n55Q==
X-Forwarded-Encrypted: i=1; AKwUvBw8/25eyC0SYm9zYeO7xCwCc1CkyWruS5CXlAbjZSaSmxtTPM8vg2UUIUx8ZtarWjEuoMhxjBpv4lBfT7sO@vger.kernel.org
X-Gm-Message-State: AFuF++ll3QELJZWQ8UX265VMtC2VwPDWgzZUxtMX5wmoV3JCyZ3oYCzI
	YbZd69PE0PvcMIhdhXUsBJHW0pn+483EoDm/C7k8qSsUajuQZMMGAISAtND9XcXeBtJvo7vPesu
	xTp3mr1EaP+GSqAl0KhLO9lvoqDO5p3efmWJjSN4w7cNWhMusAiEKPsyn42xsyrUlel2T
X-Gm-Gg: AYBFou0/zqLcaeXCN7udNM9Y5Qp9VLE1oYpLXFxDrPDvDQ4S/PFZN3Yaxy22nsGNDeL
	Lak3sDBfC7fvGBsEJt7P+Hg+VLEcreT114IUvjMHw/xwxVJzIJPtzQx70tGhhdeaXtec3xH4tAz
	eS3qFG4MvKJU4NKUVBFk3Wsdy0Vh+5Pkc26hUnVPy9Opdkyf6PqBQwwcS8NSX/NA11OwX1oq18z
	AGLHXIamN3jSVESwu3hHD4ykqDMmcqDybO3IHJPEQIXLtIN1hOhtG89N64MVm7h/+pNC1AqktGh
	w6KwB+z0q0toz4wjQCzO0P0EYc66xYiWvfUZiqyAu4PCdXYt6HIp7wIrmAZka7x54ogJKvIIkCZ
	okXSX9HwExuB7le7zNVm3gqc4FtqJi60a
X-Received: by 2002:a05:6214:5b86:b0:912:1333:e04f with SMTP id 6a1803df08f44-9140c1331abmr40600456d6.0.1790167730611;
        Wed, 23 Sep 2026 05:48:50 -0700 (PDT)
X-Received: by 2002:a05:6214:5b86:b0:912:1333:e04f with SMTP id 6a1803df08f44-9140c1331abmr40600186d6.0.1790167730121;
        Wed, 23 Sep 2026 05:48:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c5c6csm116628066b.16.2026.09.23.05.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:48:49 -0700 (PDT)
Message-ID: <8e12599e-be86-49a8-a9f1-7bc2abf2eae6@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:48:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: qcom-geni: avoid unused-function warning
To: Arnd Bergmann <arnd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20260915200435.3524505-1-arnd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915200435.3524505-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfX/sEVQMdhNthn
 bjiTBY2uCjwQRao0/DbRUm1g66fNrsMVFO7DwxeiItlkb/NNYOFpmgU75/WTocgmgN+g24bKFQr
 x+V80CMUr5j6+6bpFMyq0XT+ak4Oq4tlMKBvh9onHySn4/Typ4gNM8zQ9Vx1OfFVIC6JR3I0AO4
 jRTjQhQV1+1JtVMBgW54NeE6+7Kg7DqitkUOkDxVzgAzWPafi7BxiFv9H9kKw96wuIlRSLJ16TI
 7zFeEF89qhLXmnJ+AgAQc3nx63zT+Je7TaH6P5/8+y9FdRnlPcJsmTRJ8mKPcK0OhQxZinLrn2p
 /TfbytT+y0guVukHKWup8CnRn97Ruj7m78rD9l/oamb4WMvQMacEfT2eLJbngG3I2sPXNVS7lVZ
 667BQBRyfAwScQovEqJJMunr8BVjz5Giy1KDrcZLcOGRD3TUm6ds/KYCpPOkg6Conxq8AwxDiDa
 t8PGqw6BommAXowSjAg==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3cab3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GCO5t0sYmCnv8Esj6DsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: DgsoPYu2eMtS_0R7xF4jiY7nkZ1knFmr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MCBTYWx0ZWRfX/5JT4909BxXU
 vavb5VO9jSO7dR6NfhE8nqhXZOIQxQySB/RJ1G9DKlMW6LpG8b6N7euK9tT9LrGO6L02rwBoP7e
 wTzx13dhkyguLGjKTrMQZaq2A++gn5E=
X-Proofpoint-ORIG-GUID: DgsoPYu2eMtS_0R7xF4jiY7nkZ1knFmr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230050

On 9/15/26 10:04 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The qcom_geni_serial_poll_rx_fifo_locked() function is only
> used for console support, but defined outside of the #ifdef block:
> 
> drivers/tty/serial/qcom_geni_serial.c:918:13: error: 'qcom_geni_serial_poll_rx_fifo_locked' defined but not used [-Werror=unused-function]
>   918 | static void qcom_geni_serial_poll_rx_fifo_locked(struct uart_port *uport)
> 
> Move the function definition to a more appropriate place that
> avoids the warning.
> 
> Fixes: 8200871327d1 ("serial: qcom-geni: Keep FIFO RX active during console TX")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
