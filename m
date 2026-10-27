Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793103540;
	b=rfR4tHj1b81hHKM00ApsEoNcHQxmd6A18g1F4x4hLRn47jFQedfIz7/AOA7Mnl6alX9B
	 CaNAH7PjekP/kUC4mSHEEunq4egc/LRKYUwvRj4JGcH1F2qCUZ5sn3pUXHetu8dg8tLLt
	 rrLC3fuQMw4JReg8rBPQ04X1QYMIi34qe1QvfPDAp2lcDL62Z3vgyOpCk3EsDpw0rvyPG
	 RhUhrNd8ZYkiNn5EuMTc5sy9XBMG8jGXaP4072dRN0HQv6pBQz+CPh6pk4tBgGV78x4sF
	 rVkI59uaoy9owRN6O2UQJmNlP9Q0jFvIz5U0TWUwcRC5ml7+7M2XLtSLUgrb2tWolyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793103540;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AymIl8NUuoD3cq2I5G4+I79LeWGYDbcm+efxd2TumK0=;
	b=UHURRxPvtutkSzDslLwOKuuFozAv/f8a7YA9cLU6sp6Wo3oek4CnGMWa+9cjWc/tFV3j
	 R+Zp2+C5/kjuHO/Yo5X+1ZnrIul8TXhCsgtz7Sr0yk1WOjgMyTdQ0e+/l74msWvo5OSCB
	 e0Kj93WQz4VrVru4NbeiXdmAe+f1pYDwfD4tH/zLYQ7v6GgfOw9RQDY2SSVpIGKDH7+CX
	 3ygX/gir+2mDNdmV5TqRC+XAQw6a3DoFr2VUFKhdZS5a4kM5qQSo8PfWeFFyJv+GZHh21
	 Vh4M/SGCKjtiYhnjuKIJaqUpYMTEzCk9HndKMitnX+Vw65jCIvtBgT8M9XFYCKTwXeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=klPNqPRa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rjj0NyRa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FE0606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08FE0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=klPNqPRa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Rjj0NyRa
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdsOS1973264
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AymIl8NUuoD3cq2I5G4+I79LeWGYDbcm+efxd2TumK0=; b=klPNqPRau43upOnZ
	y7bJXyAMwY7ch4OGO4a48+81jW5FEw58DssTX6W9jKoGfyg+K8EOUkleDbcnxHlq
	CKQZ631zE5+yNf6HtwYYEAQWz9aki9Fe5fqYgkEB5Q/e2TfrsMTIFZcgLrvX2zp+
	BAjzOwE90vqGNcMgcc4yHU1UoRfiw7QfONOWMJ0Zxv/9h3kzNXX68tWcvarNW+dY
	QnnTWds0RyKrFPvBIBXNXnJh2WXZxZQgQuIVOGu2DKeEImzWYn3MlDnluK68MFo3
	OuNzZFwigGwukjuRqFQUcV+UAPxHyD0MF5iqYQzs53YYe7OpGJtRZyPVI0SldrXi
	UTEh7Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1gg88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:18:59 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eacebedc9bso63577e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793103538; x=1793708338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AymIl8NUuoD3cq2I5G4+I79LeWGYDbcm+efxd2TumK0=;
        b=Rjj0NyRajzzGJhxWJDhWDbXOM6niDOyof6cKKfMnqE8eoIwCX5vxC9dP+GR/6bA2T5
         QJoe2DC/CE3rcbz10jfttLglKstp7lkB1nP0R/z+NrJdxSEWdmYDWDSg+iQ/DgHC+Wq1
         a6AL24+qlmBUR7bOOH15KLCH2w2ccbwjlTGekBb5Z6nygc8fScn5LBGoWhbbOCE0LwuC
         iOFhdBVaNKHTz028XPayv7mWW7bA6evnXUWR8b+rp9GpUpjlzJxqM1j48PezniSdDjAP
         R+qwjxf1K/tUGo6MFSTddmzqPLAA5I+XWQkttHujqaRaFpTCwlAYZx/Ge/x5LPPGBXrg
         BVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793103538; x=1793708338;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AymIl8NUuoD3cq2I5G4+I79LeWGYDbcm+efxd2TumK0=;
        b=nIV3vlANpjsA8JbhOHPjr7063UgEmptrCdWIOzO8vZRNgVZi+hM+SfWgwCugTcuY60
         /QmtSKUaLWkstjL5whvip784lpvP+yA3lDkHhdnaKAyfnoP96yGGypfGbwOFrA/1T9DU
         zcFKz9EK4eaN6DRbgTCzGmPZckBveBbq+vLQAhqK+3OK23gUFm04jvt4v3X89IBrF0XP
         D1S5G6/Sip72FGtFwqG+z2/ISc2mCEvjGPaCEBpiyL1BBfDDYxpI2YKLbfwwUiZ9coUF
         5YveCVMAOceMLg9i7qLjio3VQI2lJIZkLU6cVAq+n12RrSfCpBGOoIpdtVZR247X5D6n
         y97A==
X-Gm-Message-State: AFq9FYJVFcu0NI6yla2Ctwk5iDifZdjZdYmBhUJYs9KVvUvccf9p6yFY
	K6wensUbDUbqqh5jxqsK+8dO8G6USkSE5voAbL1vYnGFnkMD8Y/KximxX7WK/efYmRGE+hyOrga
	KvDXqIR014XYN7ZAxLfgx4Hsac50XLfELxLJrWshn5qA5LtO+tkvTMdxmtZa1fa6KK9oUSasj1A
	6x
X-Gm-Gg: AYBFou0tJcYNnOe11t0Qe5IItBrZHOxOO7dKYIXyyAJBEqdHuwkH8xXXV+T1w6vDv1H
	HdpFDiZqkUVOvwknvDH8Uxk+RKEQlnKz1p/GCKWZHTl5gAK1l9RXhPdQw7TUANBv2Ln5vpdBTWF
	HUx6ZiDzL48HD0x7mJecV1RxgoJshZlYQB8Qi5nF8el1lkvJEuX8nRvgCodk35SdC/ynro3EAWs
	7dcsgIBkLIyrWNGSFMUPpA2RlNgLEPy4qqF5v6rhFxGBoZZFKhIA6rkGtYETwcWvgyNPWBJ0Jg9
	AyxZdS2y7tEt34sw31JtS8HeoWD5eQmFv91Sxp9hG29cwG5MTVhVQur8Zm189m2OAN5VnRVFGFC
	wt81OEieTOBDIVqGzwOCjQA==
X-Received: by 2002:ac5:c010:0:10b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ec230a43ffmr3512996e0c.1.1793103538132;
        Tue, 27 Oct 2026 05:18:58 -0700 (PDT)
X-Received: by 2002:ac5:c010:0:10b0:5ea:c3bc:c584 with SMTP id 71dfb90a1353d-5ec230a43ffmr3512972e0c.1.1793103537572;
        Tue, 27 Oct 2026 05:18:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd0f6f1asm447056466b.0.2026.10.27.05.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:18:55 -0700 (PDT)
Message-ID: <11d89d40-9a2d-4e5c-bb0f-3cee5a4b0393@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:18:53 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] soc: qcom: smem: add IN_PARTITION_RANGE helper
To: Albert Esteve <aesteve@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sarannya S <sarannya.s@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
References: <20261022-port-smem-v4-0-b0baf39c6e01@redhat.com>
 <20261022-port-smem-v4-1-b0baf39c6e01@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-port-smem-v4-1-b0baf39c6e01@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae096b3 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=jyy8ADtZjKfwQqIx334A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: 3NMO1Y7OZJ17OW68Nsgo4OcvfBM0OAPH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0OCBTYWx0ZWRfXyyLTkgAoQ1Ft
 ZOBeHMKlQYAMYzpHPo07TzkE2wkl/6StjQ2Skeh0k7lNDg5PN2ROtlNxHUocqe4+1yShoDasMW8
 pd0/lrj8jr+lcgbf+AXaRYFjAhRJGek=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0OCBTYWx0ZWRfX/WgINyy9RwdM
 Go0iGifk8B2zKalvHTXkYLGNHMj6A3Ng6ei1li4DKLsD6GFYKM9oPhf3JT4Dqtomg2MieK2cCMP
 LwUEowzzKgIOPIFVtpo5ylvp+EpmZ0SILGS7LWdFCeVis3R5nEZFPrdPaQrBPK2CKZgcSZ1we6b
 ca6iAlmc/0TgG8U/Bk4mlygUQBSes4C2M3OMQmM5Dm80aIRgw698v9DFh/wZ6qDdVXgeIOeX20e
 sEP/mWqzWRRst62Dchq19zsjYMFZAmJV8sMU5Qz0pP4F4Xh2bWUdLoEiiULueBpFMG1nGoEqE5F
 mbUsPKtWo3T39EhnwgxUhliX9yS17/cvQvZxPgwjWJCIo/LeSC9FhEcdF8lyeuJgkWDDK4Ma9z/
 M05aW9FdWWEpTuK+BsEd7HUIkhOSfok+4JENZXbHFj13vVJ9yqGxQXNUdnxgxt0/vZddgn2PJzN
 KXD9TANlrGp69L1ToyQ==
X-Proofpoint-GUID: 3NMO1Y7OZJ17OW68Nsgo4OcvfBM0OAPH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270048

On 10/22/26 11:47 AM, Albert Esteve wrote:
> From: Sarannya S <sarannya.s@oss.qualcomm.com>
> 
> Add IN_PARTITION_RANGE() to test that a pointer lies in [start, end]
> and that pointer + size does not wrap.
> 
> Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
