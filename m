Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34C5339398
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787221827; cv=none; b=NumOpZXqUHMdVUvVBCs6A+2w+KYwRBjqxrMAFEFev7r79kyK0ZnbPa46ssQNgm7JRk5L/u0RAmWUa67sEwpD7yjVhRleoYkrL2O4pK3G0MBq4lfQElPhDUV5pRcQB9N35Uy5L0LI1whzH0l695XjSRz8e8QNeTosLtmGX3u+WvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787221827; c=relaxed/simple;
	bh=HPv9hQ1X4Qdl0VjYTO2v3OjAX3zC8AUQvrpeQ27AzV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XUWn9JRyM2t+aPl21Yp3RrC7RqGnfnbRn1nXXASBdqcVWauuc6FFCpVrfRBSg14MpqDQgNMLolxuTvLsiirW4QfWfmiKpqp/WVao1bs55CbNAphnH1wkqV+TmJV5a0TUN0ScYBguzXa/TBMHNO8whfXGtuYb5p514GfGq9dCMqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmGKHPvJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KKBNI9M2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmGKHPvJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KKBNI9M2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA2mRP2932707
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=; b=nmGKHPvJbxBy/+YN
	ozJ5AYQXNor4QW1W8gJXLQHRVFH6riIBE7a07H2Hz2mqH2NxVBL78Sufwk7HWTrT
	DKkHhyFXYsd1sf5niq3jB6JG6kRN/gx/3jQsFFyh/yI06eyQX3/PrAQNU+XheLJg
	viirKLSyg4Ji9EWLx7S9sb4Zjkaqy6BLMeiOZXyDdD7V0reh5NRTkaZSeGEbTQkT
	IjD9Ks30trE72Pthcs5v918DzfSth/6/elKb2KvBk5mZeKXAhsSuBTiQmUvZ9e4C
	cFP9qQaDkkSfj30OmNBCZcpEkXS/i44QHdlFs8Cto2QMxCfLJPL/FhHr8iM7qqY7
	j0bSpA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg0g3uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:30:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90c4d46037eso970286d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787221824; x=1787826624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=KKBNI9M2HD/MSRyLpDAd26XUVSkGwbjwdbeHyO1mURjGkPQVaaPrzMwA9wWvAgtisJ
         EIG7dk+tKJYjtWgJV5jMVgvLLrreLiC25Ms5PhrfwyWHS2tjwaG1QTXA850JOndcVLWD
         Drw7Ympxf6v7+LWMMfeDVwT7arDgqFsqE/TcndwC2XVesN3KUDMqP+uV+GbsBFZpsbpt
         IwRvjEFj5J4N4ZTERCgtAspq6p9szTTNXySVUTNDiGDVeIwfpoNmB/3Fbv4enMhZK7rM
         2F0L4droKZmYR5G3VmAThjHEjq26vN+o3SIgctbZeLWDv6Xp3kMzDbuBkgzyNulVKUA2
         4bZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787221824; x=1787826624;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WCuVHH77yx2Ca+zk0w7A+/okNpLd6QuqshgFoHUXIE=;
        b=E4EmC1jUi+XMcVZn4yPGxQcVFzr6Ry3Agsxh5mlOO1JpmCTomkJaJMXzvf8IE3HNhH
         F0HTOxxa7Jg4RwwN5GqkPFazsdyf2hAycrB76+kTPAu/FnIu9rFETVJjf5xuB5FfBw2w
         jprsLuIo3SN8kt9efn584MiVKsbJWMa7cVXwaMVOszmHUJpSh2Mdhut3fX8+lLiOwSgd
         pRlUqQkEExLzRPAXBLqeBu5V18NTFkJrLOz6o2b7arxWrf+xAyY8rFhNP8ZjuNoCs8Br
         HLKWMlclgdwBGsVKRh8SyQHNMmhXGiz1vu9bTV9xYm2kxY8LmGLm29RLKliBeHdXmpZs
         tnPA==
X-Gm-Message-State: AOJu0YxU4TSJI4JdZP30EbiYHVDQHe/OiX0QwuVWRyWw2NzHdS9AgoTe
	u3lCo1QvoRkIdZFYpJGWzlPOQPbrkqCidyOJEKK/sT4ubuVIBFKwF8A/9Vl5B/dVnVM7wJZXa01
	bJ5AJAtOdxnXwXXOA1zJJDuyCej37lO64dqHvgrzgu1kH7Kf6lfzv8Bt0+qL24+KCp6vV
X-Gm-Gg: AR+sD109yow6I8O+firslhHXyv3QHxTr/Gwjhmv0m2K4uTba8dJ4X2jGLGoMqdX4FMQ
	dD1Faewc5oJAhaJMNxoVr4IeGNY9aue+aQ+Ky+PTyF/yXP/BAQpp4KxpWCDanBfNoqDb2vxAhJp
	fkG6/S8GaGIh6/9k9tUzAeP6r0L0hR283urkfiO6gt10NxJzPTU0kHLSpNvIfgLoaikvz+gSoeM
	qSeGmhbj9A+JmMpBbAiRS2MPf5dw6x155c56nxRnYtqhz0VnVMmle+j0lDSRr4CGYlr4n24Hbh1
	IBq//KhustKGkQRjH+o0OHWIUGYehakW7SlHl3u1dWFKTEgvQVkSdd4GjhsNxF4syqEqhL3y3S+
	/G6ubzjcBy7hjCUhAvIAEHPuM
X-Received: by 2002:a05:620a:708a:b0:92e:5ef1:9072 with SMTP id af79cd13be357-9371e6a9beemr814873185a.2.1787221823980;
        Thu, 20 Aug 2026 03:30:23 -0700 (PDT)
X-Received: by 2002:a05:620a:708a:b0:92e:5ef1:9072 with SMTP id af79cd13be357-9371e6a9beemr814868985a.2.1787221823486;
        Thu, 20 Aug 2026 03:30:23 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b0b00esm52770466b.23.2026.08.20.03.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 03:30:22 -0700 (PDT)
Message-ID: <0cba8a85-85ea-4648-b80b-fe52e6531733@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 12:30:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] clk: qcom: gcc-qcs615: Tie the CX power domain
 to controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
 <20260820-qcom-tie-cx-to-gcc-v2-8-e67ea30d8b7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-8-e67ea30d8b7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FzphcnLNp-K0uhZVhKgx6G3HAkDcEw10
X-Proofpoint-ORIG-GUID: FzphcnLNp-K0uhZVhKgx6G3HAkDcEw10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX6upYm7u5pYOY
 twq7SKfTSsseDGW9xE8NH6v3Zv4/Qyo3FOFpEnTwh6GWbLBrGKJm1wdMBbzv/Rp+qLvXU3geC8w
 Rf8uJz7785ra7F2H8sK1d/hJyxinefzSrwqdrG8rRGmMazVvchkCi/QA3pb3067DH0lPirjwHTi
 YCYjPkvGeEKIczltiNARxQrPnNTHzKsT3Fc+UqGXI2dsYkhtwkUbuduegxMqgBy7SZZ/2PPMzui
 S25YOZua7JjTSN81CmhfgLPnVztmNZkRs5tyl7qYOt0zNxLBK8eMxPm7T7Dtsopn0FMlO6vvRZL
 P/RWUxPifhaDo8Kp9oMLQEDQPfixvtVRRfa/xOC7JpkrzCi5EJg49rhNomRMQlAKzq8UgMFwUly
 YXdapfGKbJ1xNwBuhxIa2lDk0+QLjkSyyjZgBlsnGPWcjzta9smxI0RwHL/C4I8p6Tl/tkxojMk
 jmFBtqYNkJSdRi4/XbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NyBTYWx0ZWRfX29jb+L1mgzYy
 BFlfYNqQhIPvIgxDjftCSGJ69JnNLz7eirUsyGLK8aVl7i+JkvWaEh7kruFj+D6unlybNAL6j+H
 odfdJTcdyFFdCFuM4f2jFdPcGSm3EFU=
X-Authority-Analysis: v=2.4 cv=JoXBas4C c=1 sm=1 tr=0 ts=6a86d740 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8AEooqP_IvclZvvwVwIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200077

On 8/20/26 12:07 PM, Abel Vesa wrote:
> Enable runtime PM for the controller, allowing CX to be powered down
> once all GCC consumers have released their clocks and GDSCs.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
