Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCFC4457D7
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429269; cv=none; b=UZ6uBpH66+N2wmRyoeueKJ2uG2EygpRfpgI1qP14I3Ym9AJ75QJACruwoXnTSTPkF+3ufwvOoEwvm1g9n9CcinLYYF8dh/8XElQEr2h8lElyp29O7PZ7QVDs0f01evc094a6vbtq1gXDlzCnRet6dkRcdgTzNVyLvIsLPibtKZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429269; c=relaxed/simple;
	bh=gXRfC2VjDT+XZheOHTbKbVXeBbM9bMyYA1/mdxx+YNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a8Y9WiFLyi/Yd1xI+l4KKrDUNWn1X1yhlVr16RShghTChnbtlMZkchgZ3opZSEc1vU4zjUNV8LGSD0QE6vaE9isKyvcluGLD2VpZsiUinKGPcJEyFx35L6Ib12O1b+UWyDnJCP8/d6Gd3syWzAfnybDUyv5ds3KhXu1EH4m7dpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OPWTosx7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hoXwg1RF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OPWTosx7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hoXwg1RF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWgTk1835867
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XnjmdFxiHJbplHqHTRM7ARcmcbr5wAPPkXRM+q1ZZUI=; b=OPWTosx7xtooPdQV
	yHjJ9jqz2rPsoV/aQcdBbj2WYdVyYFc3+pR9Nj95skiup16r1SX477S/gIEdiIQy
	2OZEZ4XGs2PThTrpQbjBzqNmXguKyQeXssRrTg51tZX3w2mgPXK32H7Q8vSxU6Ok
	ifoB596Q+i+aNlqiXKsQsDi8o3DC//Vc2KJkYYa8Dod+TQo7jJ9yhBveMG7RG/Dx
	N+oJEj9oVl5z/Oj59WwKiHGgT2V2orrdjlxLrb6lnnfZRm5zgEVQFdJndVAgofKv
	aKW9LxFMjuoBN0DMBkUc08CI1upgaOBUUR/9PQ8EsLq3kb21g65hRauxd6QRRu89
	mOhP7g==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8gy0pat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:34:26 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66898cc78f7so3471198d50.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785429265; x=1786034065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XnjmdFxiHJbplHqHTRM7ARcmcbr5wAPPkXRM+q1ZZUI=;
        b=hoXwg1RFG0f6ihOF8Nm6IKR5MVmyknRS1dlLi9BlqQxjoFyfA6MeoR2rtZxh+BC8wW
         r05xB+6lMcUgmdcZ5TjiIwqULlTgBlNfV7Td8AlSolFAatGxnLqTj3YyHsIxE89GVkrR
         aNiCRX7Op4qhr/UcCHrM1cJyqK4A6icFLOB+e2Icld99++Yxg+dGLPJBaVhMEBJ96QIQ
         d/Bkj8WSRj0dDaYX2uCAF9pFusvLKMbwi+u9/SniqC4AGpgJigbhEtoQJmmr5XIgNUNF
         h40DGkO1BWh//27k6pucvDZiVaPTU+NlUSpX2fyjFxvQOMzmJ2LE+R0MeSAwWxzuaWtH
         /HqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429265; x=1786034065;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XnjmdFxiHJbplHqHTRM7ARcmcbr5wAPPkXRM+q1ZZUI=;
        b=Y7TC4SDIitBkrbwIhPhW1fQ4nvlicHOA817audVhFEXb5opFtnTVXja6WxspnQ0keG
         z8eHRIevNziZ8hqi1GL3wwFob+8R1LMB1MmN2lPeabtZZJ5TcOvga4I/pi2wbrz3rZQI
         sIc2afpfGYPQ9Oz8V7nHZ7dV38+yi8B7fyZZUkat7/mBeyPeHvOJmGR5uVZ+NE4bmQL5
         IjXnNr4RAnpPR14v5X7TcsJ9nBC74Eo6eBH/sb5NeYkMdURL2H79dVgmTDUM/Sb9ukjk
         LS169PGBEv5SiM61OqgnMoN5Q02Nid/wuICDPlsEmV33mJPLaews05KVuHao6c5c9PyQ
         uzhQ==
X-Gm-Message-State: AOJu0YypU0HF240HkSx9gvUQdYS5LkkDV11A6lBoolWhdGQLp7Hio9lK
	YOClSIzDPjQ9sgJOkyZy+RLFIxxl9Dfg2aZuM6NNxPWQbN/Mrr9mgT5V2yB+c2Q3XtBHY9xFyuA
	RHdoV8/dhGd/ldKYi7ryhYDo/9a9HjWZs4DNRzGnVcif6bHUsaz710s6kQny5gZhS+wCk
X-Gm-Gg: AR+sD130ZCLoGvopmocvlZx8upFYAK2JjJ7wZOkIU8cqlfc30nYJVwNP4jfzKPoUJRu
	a1LibN4KEYyDy+6Et/qAzefCPe0hCOeIrRNq8zJgJ+/aHVYjflCZNyJa1wVy1lxZX5t1E3rVrvK
	RaRFdhEET6Tjc1XS7esswSVo5bOlb5h6cdXrdHYRm4b+KyJUsntkkJYQYrdsM79BH/sHBkPY7Ci
	szcF8i+Gsx9cRi1XqhCyXZa+nVDMTXf4T9ig75m5aRkBMEWpHMKOyd3TTzXI237PJUctWnmujOt
	EBSEh0GDFD2748M1LnOZ5Rru148aufpz3hKIY5UtrnYEGyc0cAgOdpKeynHlgrNYxvEoIP+gMd7
	2AJWzLBR05ocFFvq+fLJv8z8M7eQDegO7C1A0/N06f5mdVC6Fq0utP0wXvz379B3G7A==
X-Received: by 2002:a05:690e:d4b:b0:668:8986:83a4 with SMTP id 956f58d0204a3-6692f83a99bmr1913837d50.98.1785429265638;
        Thu, 30 Jul 2026 09:34:25 -0700 (PDT)
X-Received: by 2002:a05:690e:d4b:b0:668:8986:83a4 with SMTP id 956f58d0204a3-6692f83a99bmr1913793d50.98.1785429265109;
        Thu, 30 Jul 2026 09:34:25 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:2206:62e9:bbc4:c360? ([2a01:cde0:108:24ed:2206:62e9:bbc4:c360])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6692c9315ddsm1608848d50.16.2026.07.30.09.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:34:24 -0700 (PDT)
Message-ID: <9d14fbef-43db-4463-b7d7-e5daee1368e6@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:34:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] arm64: dts: qcom: kodiak: Enable CDSP & Modem
 cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
 <20260727-b4-qmi-tmd-v6-5-973cd3a226af@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260727-b4-qmi-tmd-v6-5-973cd3a226af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9w_y9ADkJMxQ3dc54hNjo2CXz4Ss5sEf
X-Proofpoint-ORIG-GUID: 9w_y9ADkJMxQ3dc54hNjo2CXz4Ss5sEf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyNCBTYWx0ZWRfX25JGzpPybKIr
 8kk90/fjHmtWlzPg9VvsVDq6EfNLSOJvtEXrLw9E655n8YQVV3hv9U6p9hA1FUl9yEFF/EdS+gz
 NdoTqGS1DPkPEM8ERoUlWmvwyLCBrqKXlFYBGRnk+TGonp5On8kr+7kr2VhK6d0yJBAfgLGrPJt
 edb51PxKUuw14QbkooMZRKz7JlBXJsFbrN9zwTyL83zAcTbI3y4ZQPrPc535GeLZT77ZSoHWqfp
 xvF4fe1SQ4gaEf1E/T7lsjnEeStw2Fyczp0ytA8BJ/uaXO+81c2GxC3dGfS/QmG0gAITkkmq5mz
 hnAJiYOMQxPXbFLxxhIY9MM2mkFFK0u1Kv6T4kxzXQ8DHTjpjDU/P+qxDblpiMyarBgUCA+VHnS
 boCK6w9AkrK30K1vSlsnxYcLTyqAhSA9SPnqTU9drx65pDASe0v9+F64goJjhnWTYSyN+sICl6y
 wMuKewYd94r7M/2SAcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyNCBTYWx0ZWRfX5XoN0Cmu+Owm
 QrTac8Qj+HKue93sCtpFSTipo+9LubUkdRhU9t3e2AWMWnRmMGJptXxZrjI4mFlphXCgUmhIYMa
 eNI90BhPBgxVeM5YK2nhN6tHZXyqLgM=
X-Authority-Analysis: v=2.4 cv=MuliLWae c=1 sm=1 tr=0 ts=6a6b7d12 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=oKFihCAVH3oSEhwhxOsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300124

On 7/27/26 16:22, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
> when it reaches high temperatures in kodiak.
> 
> Set up CDSP cooling by throttling the cdsp when it reaches 100°C and
> for modem when it reaches to 95°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Since the remoteproc_mpss node doesn't exist on non modem boards, the
> cooling-maps that reference it cause DT compilation errors. To fix that
> remove inherited mdmss cooling-map nodes.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
