Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192C5471262
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256501; cv=none; b=BBHsVgX3EMjlme8UlVDYkeIpZS15O373+wNngejcNNSj0VyjUBoxuf1XwIUp83S88rEYUqcwGgVYTWg+UtiLb+73uW0lgoN6bnsUKNmdiDrKXd9YvQIXx63ndfqTpjs62is9coe5uPIZ3VrbuDedt4qiTmeYGD2njf/FAmerM2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256501; c=relaxed/simple;
	bh=aqTx+S7mshxuBbBdKgQ5CtXuCc2qvNYpagvsr0pk6Mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qgPymthxODBvMCfWCkb7p4E6aGA/WKOsOaj7igfUDJt0XDm4xYyA1qxf3bhpuqRGtn2uUmbs7ZOADyZXBiuXy9C/Nn3lmJc6DQCSvqKnLcllC03c/8WaGC+9Gem/CuGP69/PX8Lc53+pF7+mXDD/16SImR88L+Du/mJ7HEPNBwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DFMV54XW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnzA1X6e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DFMV54XW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SnzA1X6e"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179HKY1975448
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 09:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLFLzCTnod+0cKWMNOkucUdWpp2/XKB75rkTGpsWY3k=; b=DFMV54XWK56mGXde
	2ZYukS7rpdABxgRYXB9l1+MCK/QkIvyGVbwkpE7Q/JXBe/7+7BIDLiPVWibp6ujZ
	EPgO2sHganB/FmWSPsIsvHZ+mzkCCRQjcjjAw7nntXf9DyDZ84atno3qKdeIf64a
	CHvUrQZLRnVa7Jr5PYSFadNVRFz0o/mETFmbmOcXWCdma87H5sCaPeWtmtMtUhAn
	KQEQ+hLV4q38GqBL+GVzRyHuIz5/5NkKOilRYs1+4ZUgmZnQmofUGuakww3JXG2u
	RoqPikhDDqQrqSiGzcZamwaRglpEDChb/Wu/S5c0asY5y12igfIZFoGjlcd2OzTm
	HqFK0Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r1pea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 09:54:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93821883e26so93711385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 02:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256498; x=1788861298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLFLzCTnod+0cKWMNOkucUdWpp2/XKB75rkTGpsWY3k=;
        b=SnzA1X6eqvyBr8e1QwwacuzBooND1MiNBqEv1mwlXwJQCnrN6kvhZIjv8SrePhlirT
         ZQBDUH/85u6s0n6FAoRMoCibnVnrfJD1WuaBT/5IzRy9qKb7W25NpP8Eay6f+KqySWcZ
         kSEWng51RkOEJXd5CoVyXeGULV95kg534ElLvYtuYmCpInPx+weUglxuym66jIBtDXU/
         9xK4DZpZ3I/cNZy6NtFvvNjAjVubeZm4t9WZ5ZG/9jJ2/m+oEACwygUDCEcOEqTPCm3b
         /xGeBJImLGoRXeWGF3i2fOGmE8ocBnF8tuz6qp+dKdCI5UFt/jF+xXdCwgyKAQGRxcut
         XeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256498; x=1788861298;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLFLzCTnod+0cKWMNOkucUdWpp2/XKB75rkTGpsWY3k=;
        b=j06MPVr2HB8k6lJi3jalEbHN/0a1Mt9/GE8EiwTjxYDOo9sJzVIpWI4Magdg8g3Zz9
         BfJzhQHPBxpAcnqRL19rimvTqUX19ZYvueaxH8srfFXWjzUg37vZ+6ubauM414YjzLil
         nd8kX/Cis+ZQoxzgb5sBECyJgkpkCbeEUllVSoOZvTe219LxnAkApCnFjBSx+dRqjVfB
         /tS0hvGrZUV7J4nsp02n3ra8ERP0/Hve/yjsk60kRr+bwpOfaxcpGnJWp2shbdKGZJG3
         RyX8fTAnM++b0384RX4FXKT5KbEEwe1ioLMmOfFyGQcB8jvbmB/n9Yy6g1EMuSBkmGmp
         WamQ==
X-Forwarded-Encrypted: i=1; AHgh+RrypC72qDVd0bzuVQutrqALcan4azW9Zta0TJ05UTbUYRLQiuUJj4e33MDwCu1IGanZHNxC7jEnA6TiSDnT@vger.kernel.org
X-Gm-Message-State: AFuF++m2ZgyG+8lWMGMicdLk7hgIaCVVFRH7jlCxFsJ7w5bAHV3Vg5WI
	yraMzUXYUZjEji3essQaKBqs4LIoYTOxdaTVEFv9GOFsqDsDG8EBPVZTyTJWNZZbNKXfySqw8oF
	ggdC4bQDWPkht6Tcr9qYZgLn57IUNSvkk3GEe/cnY1XV9miKWkd92xDEyn0bqT+cvkrPf
X-Gm-Gg: AR+sD10Bui7nUrIvDeClCyeOSEzl1+Y5UCl5j6sKk/LL87uOzClbM/w6J/+bHYQaYD0
	xlEV75677VwzCURZ3QYThMO50Ll0wMCiRNpgdH+2YJqzaxhID8SRvkMHpGd5crL5YnCOOOqm6iq
	xA1q5V4F27hqrs5LUEi/TkmVNkOF503UIBOHrOVGrXbaOmSp6OGQARl+7Vt8Ynk+syqsyZcX90n
	nZOULoLscLH2oyUXU8pSBVSwZgDTkF/BzXs1ElZdSXEVDhLEnR8ymMGcxTKEECV5ptcXOFl+8Aj
	HuZG3onayZwBJm09wkZrKFn+SL5WJ/vTVAtZZfd87GqzaI5+7AtbfriIHtyf0yTDjbUe8bJpgXL
	60l3GcDIVAyYLmJF2JNi5Kw==
X-Received: by 2002:a05:620a:1a2a:b0:939:17ec:8a81 with SMTP id af79cd13be357-9392879009emr1329689585a.3.1788256498402;
        Tue, 01 Sep 2026 02:54:58 -0700 (PDT)
X-Received: by 2002:a05:620a:1a2a:b0:939:17ec:8a81 with SMTP id af79cd13be357-9392879009emr1329686385a.3.1788256497692;
        Tue, 01 Sep 2026 02:54:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25ab2f9aa6sm193944666b.35.2026.09.01.02.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 02:54:56 -0700 (PDT)
Message-ID: <e1b7e953-2372-41d4-84cf-cd2fbc54f88a@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:54:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] serial: qcom-geni: Avoid double-free of PM domain list
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, praveen.talari@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260901-probe_cleanup_uart-v1-1-0bc2b00c970e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-probe_cleanup_uart-v1-1-0bc2b00c970e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a96a0f3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=5Qeq7Wt-fVvOjBGoxIkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX/Ya0BeqjsOLB
 wxa3ughmEJ8fEKR56QO6A5iGnb5oPRwvkTL3GEAyrv8akB3jJ8wOc+KUjR0KnJhmqfxVQ7W8rjy
 kbF6fL8SOttPPLxahK2+iqeI9qnSDFRCvSnfxuvvPNxy3zUYcuxOWym5C9qf/+guwY0RTJRnHyw
 FBdyC6ftBoorr9FfWif/o0XiUtrX+QwsfGTGFkrS0G5WcGC1bBNoh3Xh7skuVHeEoVyuO+5y368
 c94nEtsQIp8yKfTfgipPp4Gb7zdw04hVkDCuXwkOABOlU2a55veR5XuWVzCP+d9RekA9aAwa6kW
 TxYasdeCT/YyRuQUQ+SrZkz1FOLkW/kJl8HXUj7B35kwzytEfiwEEQNdEcghVgKt4n++f34E94M
 X60g7bgX9sYZkCC4pnk8xg8iqnWqp0pQzxr7sO4dhMeDeEyVJxma72Q8mHJoHzQDGHtmsDvEPdA
 n/AnMyL9dTK8ZCRFixA==
X-Proofpoint-GUID: 2yqnz3Z5JCzp7fiSpEuiSkyuwe0F9UhY
X-Proofpoint-ORIG-GUID: 2yqnz3Z5JCzp7fiSpEuiSkyuwe0F9UhY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX6khA2M+f//FZ
 w8h8KYlzzQqmaEGiSmaO6FDB8FDpWG3pprgDDlvFpVK8XxjqatKSrMyq74WXXjiVlMzksAryj3k
 HxCapY8kY5Rqnj7Hw3tz+gGV3B4b96s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010087

On 9/1/26 11:50 AM, Aniket Randive wrote:
> The SA8255P UART variants attach PM domains through
> devm_pm_domain_attach_list(), which registers a devres cleanup action
> to detach and free the PM domain list automatically on probe failure
> or device removal.
> 
> Remove the manual dev_pm_domain_detach_list() calls from the probe
> error path and remove callback. These calls can operate on memory
> that has already been freed by the devres-managed cleanup, resulting
> in a potential double-free. Also remove the unused pm_domain.h header.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
