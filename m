Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3806F253B42
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073818; cv=none; b=dybEjnwx96+4xmPS61jCjgAAW3XRTid5XMx3T9Po3I7Y3oMxQ1a2ARAWdNIVhPUMG1kcrrNHcyrdjRNH0kHrSwNC2VuvzYLUCgySjmGHUOGZ3eABabg7ZRMJ/t0i5LXA9zNKxrO7HiSoyjNkMPU7Gksfy3+aPgShDH8/VDGRRAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073818; c=relaxed/simple;
	bh=y8nslDYrRo3CXZeMaOPNKVY0V4Lhmd2yLhB+5Zia2pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p/86tB3gS8qmDKSSnW/bydrcayGO1ES469JKIOACvcLz3aCbfjVdNaij0H9BeibgyFQJZCZ6GwitWjc4RyFfqJJ//pu3KH6NDH7zxCul2b3L1CJHAzKRXUETkXNtSkfhvUlRhTE+vomTH3yylCNJe+8q0OJCuNMuMrAbHNb/oM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KcYIwcuR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KEz4i0pq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KcYIwcuR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KEz4i0pq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M9gcvR3383563
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f7qSnPy7/N066FUknIaVgEtHr4e96rD9fDVuZ4ulx2g=; b=KcYIwcuRTtAheeB8
	AdvQnGuCoB+RJ+vEGWJNWFyjl25wKQKXesSkZ77L3WsKQH/C96V9sr1ujsMoq1K3
	AOYJc9vKaOaZBrH/tqUdY7377XMvEVFXiaaGVpOgHOwghRlRvgElxkLj1J5LOTTE
	Na4DuVEJ/7uFeuxiFzbHZ86S7fTz7xxwldg8qL8x7+aDk2mBgAjSQhoVEXkxQswa
	uuc0/CEElgVoQ+2sFi0kCvF+M43S2iEukop38XwkXVBLckN29BZpQnVR/MR6PzP8
	zgVUKU7t8mfAiTnWRb8/zFLbCYAkRTSQHw+ID14eKyE9fyyjoZ9gSZZIT0f/MnYp
	3RfXIw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkj9fdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:43:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e661ce1dcso77433885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073815; x=1790678615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f7qSnPy7/N066FUknIaVgEtHr4e96rD9fDVuZ4ulx2g=;
        b=KEz4i0pqpNSgCddSVOqOtYt4xFFuG3HGcAPrQ14nMkzkRAKtKzqGS27Fev8y+Kigie
         2CDKf00GAy62dc2neuXbrdBAL7/SxW1HbP+Cb2OHGyNLtOnsRlpU9/0N4HBUGvyUP6nV
         sa2M/MGdS4bjPeqX+naUdzzNjBN705AUsGz30sDY9D6bM1mNX8QAfnxcSJ++Zdh6ArCJ
         1MCmD6THlmeIdg5dAzD9ZoXuGvPQL1AErpSISrWLysACNkOZMvAnFdokg1Tk6EQaXQP6
         duBjuhhBRhHoTLwJN775hfPVDYSirheujTE/HH0aMGM/J8ngW5sSlMhFsy/kHy7Aue/q
         uxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073815; x=1790678615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f7qSnPy7/N066FUknIaVgEtHr4e96rD9fDVuZ4ulx2g=;
        b=sxUsu/b2VISfb1m/aReJCotN2ZEd5KEYBa3+1KpScktEhy/hYH3lnP8Ov11qvoOzwj
         rKqzgHWy+f5QjVhyZouTAH04snhdBe7v/c2KLdw7y3ZDawU5cxg6CgIXNTjrqKgoVlQS
         BePxf1y1tz9PY67ZoaiKyuXUAsp36kxIV2V7iV+cYCGW+6xMTx6OYuSUtWDDocak15Zf
         X3Rw8YZTXONSxijt3Pcac5Z5rO7xKP/gahowYUNHThkJF8UtwIuddz/V3wm7OtI8njmR
         Hcj2r562FS3Xn0xBOgtfaa4r6jL0tAFihE7Lj7uvEuighS7YDJHogSS3XSH1ZDSaLgBK
         RSyg==
X-Forwarded-Encrypted: i=1; AKwUvBwl6n40ds7vTS3K3TG1cd3pewA4IbmWttVUw+Nqf4Jwmi4dtIUcJmSWoQop7vS6ChJl3pyMtF2ScyPAql2t@vger.kernel.org
X-Gm-Message-State: AFuF++kw1clgu3ArttdbmCvDssDa8CtqFdE0ynquHhW9PNVjteOncBRS
	8wkLpFbe5qRCYHhZ4rT9h1jN2RZ32fvXwvyXca+SczcDRy0NKNPp7nu+pFmi5ZCY1aQ+wHspmFF
	C/P6BC6lZq1krTScDdO877OO4ISfj7T7MlFHWuSrfA9oVvlFncq5gf/JwWoe+5G5HMWvT
X-Gm-Gg: AYBFou36mO63WpEpdMpzBj3kXMwuyBMEDWw8L8L6U6An/E1bDAfjvUcPWVmOCJ2LI2Q
	5h2EV115tEUOrAmScvJNnYqN75g+ynyb0qIMpY7YjfbbC0MECfdE82Faer8p/Cooh1SCdwqdqqz
	m83NMjwOQGc9z5agfWDQkkl8rJhK2WlmiWxc6AvDEXkEtaq0nh5EX4KSTnODu4ABF4FappCCVKJ
	DVnuP9mCAxdRM2rb232v60nybpd1NAXL/wRfjfLvsVWwOqGAuU4pkLl1o3sj0/HkDBB5UVMqx4w
	Lut/WcAM0CZSFr7iu/vvpiq22jCagoY7cGpfib36t47z4d0LGSWdM4HRr/hE1LUPvVIT1kRCIHU
	8IYrgeuouH5ziBGBb1QzxPw==
X-Received: by 2002:a05:620a:8014:b0:939:8148:1e3d with SMTP id af79cd13be357-93c15e33943mr466927885a.2.1790073815584;
        Tue, 22 Sep 2026 03:43:35 -0700 (PDT)
X-Received: by 2002:a05:620a:8014:b0:939:8148:1e3d with SMTP id af79cd13be357-93c15e33943mr466926285a.2.1790073815216;
        Tue, 22 Sep 2026 03:43:35 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5e6dbcsm64722266b.41.2026.09.22.03.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:43:34 -0700 (PDT)
Message-ID: <5e34e8e7-a049-431c-b5a4-1a2560e051ff@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:43:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] firmware: qcom_scm: align PAS resource table retry
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921195636.1925869-1-mukesh.ojha@oss.qualcomm.com>
 <20260921195636.1925869-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921195636.1925869-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U7FH49ssacD9SqGARDVAJi2cEbVR-_5k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfX/gf+i7CacHW1
 jfFClywPKPBLMkDWjEVHrQg0R5KsVbeUk1T3XrHoNPwFmZc4BfTpb7uDhHyVSdzgZTPT1meVZqW
 eNI5Lwn34wDbggk8jwlr1ajs6DRJBSZ8EBg2X1GzhcM/qoxJIh8oy7nt9LNI80FZJ/yXKdb882z
 qloKKwiBjcwoFUOTGHStdq9U/gWlS48hJ22bAr5S9f91GahUBxix4Q/57VrLghwSDkE0ArXxBCH
 KRiKieANMu0T7GuVBt6eNDo+nw3XVa7LCwd8e6VPZJqiZy8n8C5fTGYOQn3aYaF41O10RcPrpek
 bo25Zgy1zGbK/Lu+ByFiz/YQTWSTVfZVW+QQNG99yyy/Au7djt1AR9rj2WzG61nok1nRM3plnFO
 mDlTVCKSBjzKOqC4VT14B1X87CQPtREKBT2DNt2Srb8cCWU9Gas0Aom7qtMTFFlH18kBkGzgNjz
 X7mEz6NcjXZfzDYC0vA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfX71E5+v9TnBEJ
 7Rj/IF6aP2tNMQJ+Zs9foXGAVK/qeV9eMpiD6s8Bbx/2KeFPQ2YXZe/VQx9QIqquy3MBe4RAosN
 t+xf7MjuXXcDck6pk/J31FVhJxja4go=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab25bd8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iW2TxwROTFnyptqOjDMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: U7FH49ssacD9SqGARDVAJi2cEbVR-_5k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220154

On 9/21/26 9:56 PM, Mukesh Ojha wrote:
> The initial PAS resource-table buffer can be too small. TrustZone
> returns the required size and the wrapper retries the SCM call.
> Although qcom_tzmem_alloc() aligns the allocated buffer,
> the size passed to TrustZone remained unaligned.
> 
> Align the retry size to a page boundary so that both the buffer
> and its advertised size satisfy the PAS/TrustZone contract.
> 
> Fixes: 8b9d2050cfa0 ("firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
