Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557363;
	b=kE5ZxCN1Bd91eAD01vhDmGPun8L0oCoryyiFA68pG4JavQIP+wCahp0qiNyVNSK726bX
	 /5vwc9gnY+SnwocuBktKAneAqxTX+xQ0VQ71UhyXrnw5Wax/C/hB7ME6l4OQT9ZEVYgUY
	 C+LuQzm1pgR8S0ox/d/RXNiWbr1qSTdOK7YvuLCn2PnQScZ+W/zUf/yOPUvsOanXvro9b
	 BtBs2aB3Kenr4WzpGO9E5W8Sh/87jwaV7xIXLzn+AOBRbzbXqpuRMBMA4GM54xhOEkT8r
	 w7tOKs0NaFJTBJEL+1lrL0RT3TIiTh/AwhSEbidUFYGDJaDamBQG+ZGeK/ExMhwi9EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557363;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mkD4uiCcgXHBYuq4A24cX3DO/hjlaKeRWga4ttkhp+o=;
	b=Gixf0K+Zfk8anFm/vBiZiixHnKiS2e/ifknmflOq1IYkZPpyHFlgn9jYaqpQ9hIZiSPS
	 IDkPEz5Bqg7DdNzwECCwk2CdjBS4yx3yz2txj7XByWzDuYfWuYTMBeemebxvV1gc0h11P
	 XjDqq9w6cjO6IdxevRrEDg3ujDtOoTm7oUpOmyHweT9qyGoxbTEe2ndk4mRKbRkhSvZg1
	 qFgWKG39IHe92m8DKj9a961oj32ckuUftvNBFy6wVFNK52oUD/ZvlT1yAVcO+AgGTHXJy
	 EsaFPRBJwAWqZs6LY5e+j98TdAUpJjzFcOdY9AYMSsFsGW3yu2/96Ui+r/RbUYhdDQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J40ukahT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aSfLprN0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2A9606A327
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B2A9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J40ukahT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aSfLprN0
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57DmE073540
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mkD4uiCcgXHBYuq4A24cX3DO/hjlaKeRWga4ttkhp+o=; b=J40ukahTnNUfzPEW
	lPnaRydEpZizw1sO4rxBOD7piY17oGk39Xe4h6sIXD8bOGNulJcsyLFUnnuP5YVb
	dWwSMmjOiPg/omFAeLPVPAGvPYYbKBUljs/+EkDebCv5Px9Yph7njtds81LeuG6O
	kgqsKaMhA/g8jqhzVmJ5feKwpU6yT2D/KE5XVmRuAVNL5LGM3KOikJbDoW4P1FQQ
	sfEemdhfF4oWGTAWX/pU59p8XDoQaxqikIL3FIG6IqtG+OFJPUcVMiANzeIZpzmO
	m2c2IO486Wri4vpCYWnsF+yKiS5gmbm3HEawl5vou6I3fF9+EhEVa49qfB31GL3F
	ZC2J3g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs044rg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:09:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9460411fce4so14413185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794557361; x=1795162161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mkD4uiCcgXHBYuq4A24cX3DO/hjlaKeRWga4ttkhp+o=;
        b=aSfLprN0bqRXbClMHpP6CaNBc7BmtlflbD1cx0a8wrK8ufYXJh7tOWd1DIdb0BS9fg
         124eaav558J64bSDmDOAvwD+mOo91VDYxLnnNbxIUpH3nJFOIpW13FwVLqJ+y109KvFQ
         dnv+MK4KIadET1JGGfA8fP3ZNRyrFNXwpyj/BN4OCB4hs8JQXHsu5Q5fkMoJjiQ7/Pr9
         x+K9a5NefQsGOZ2myMWU8dXOcWWGpRB12e3C6IgIGReREtMKro6dXuphg8w5PEjJnqpX
         5L2laftDi2uC+F6owkw+hPKtx9klqsBO9GOKAtFPdnQTow7sTMjocOkEfwvG4aeo9qjh
         cfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557361; x=1795162161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mkD4uiCcgXHBYuq4A24cX3DO/hjlaKeRWga4ttkhp+o=;
        b=Wc3GXrVizNTTRKSW0f0KWQDSd+fp//L+TdHsW1755urNgQyI54I57rRXys3wypSXPd
         c5ctkJowbMsnoDylch/cHstsIgyzmO1JWPWIGrCpG6AqDAtdeI+3L/mE++cazI36Sa1B
         hsvPiSNNsuq9vitRCkXeP8NkvRPE1VsJm+DMnrZa/Cuxioj9ukpH7nXKB5gHNQfLvfCi
         4O/m/5+pTSFNExxWkBMgTOyQ0GYF260kIAWENLXQ2AzujOQh3BWRoldIOKmtHGsCN+Tb
         Zw7Wf5vlFoYXBq6mgdes+/EE0YwlJRt5//FPa6F6UfnnviLM2esNDKhaLTF/69OpGVno
         ascg==
X-Gm-Message-State: APuU4Z+pG0kI/BqSWKG847TkJr9BlyUOt1/U1oL4viOuDKph19rPAgTo
	qcCSoxFPbgHhwKiqKZYbNBBHEyj4qfsODpbwkPPQ5KauR71NC8jeWAmfCrsbEf8wHvbqNUfG9ol
	nzlh1XjErCc5M9AbWBtLWu5nrFhwhJumxjHfmUtz0uZdCUFXh/gY7SwNuNMbIqBpFdeu+ECtCaa
	re
X-Gm-Gg: AYBFou0eM978kZVQEgXrtnfd7EXEnljnhnxPIn0ikY+wCJ6Hv5SPvwMu+awj2eiEmfg
	Q6QGM5EFZFTs4Kdxznlbj6iYUs569HSTpd41LzqdoULu70rfNTLbvmpfXY4HChdI6ehKmbpgnpd
	nfS9s/lNC+vXC2Q0bQC3MI5mIvWlJKrPW9V0hMavBTFJrYxnqB85/UXN6V8Rl4FN/SP8FllJ9sG
	As4WfAuBv5jXFZ4Qc2ZbUNjRGR5UeMd3UUMhz953/U8koJIPKFUTmtQmWIXYp6YyhlFWg3QXD1a
	3dGyk4jcmI0f72zVZtfsJ1rvCxlwT2Fw9NMGO0lNr1NLKi5HQuzyvYdNlIzz+hCsLB7M4ywZBlh
	A6KSvQIVOI3wV1+Pk2JAfZ2itsHVyPas+fQwFBkgshOz97LU1tvWBCoHOKuORsu5efuoC0oU=
X-Received: by 2002:a05:620a:5811:b0:93e:54fc:2c79 with SMTP id af79cd13be357-9494bc39f92mr293509285a.5.1794557361339;
        Fri, 13 Nov 2026 00:09:21 -0800 (PST)
X-Received: by 2002:a05:620a:5811:b0:93e:54fc:2c79 with SMTP id af79cd13be357-9494bc39f92mr293507385a.5.1794557360952;
        Fri, 13 Nov 2026 00:09:20 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b5eaesm646327a12.1.2026.11.13.00.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:09:20 -0800 (PST)
Message-ID: <afcb4a7a-1089-48e9-b42e-aab834547ce0@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:09:16 +0100
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
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm7125-samsung: drop unused label
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261112-sm7125-samsung-grip-sensor-v1-0-d45dd9c845e7@gmail.com>
 <20261112-sm7125-samsung-grip-sensor-v1-1-d45dd9c845e7@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112-sm7125-samsung-grip-sensor-v1-1-d45dd9c845e7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfX+WEFLfoaRY0j
 hO2IzQN9m9ngBQuYHP1clrqbAt+TEU+9mHYC5wHRD6miEaO2b0BePPQEiNIqJM4u9u50d9MEdn5
 DTORDeX1yqFMt9IIqixnBU2kKMaZ81BzagXZUh7v/8ZiNEbsVb2OMF/jjbrL6QZtHmRuoCO89f1
 ePXhZjtY43tI8SIB72hndhkgEDAoDBkZ00uWvtTO+8H8yevg0lcJZ2zCbtTUmTogEDSrnfDoBM2
 HnQivQNzF+x9Cw45XpdmGcDhxPOj/YC1Pec1zZCErC7+YUCjtH9RMhiLcoM0Q3XlSfdqETUdZJs
 C1+s8MKIuJfKKuAZIJmLfkUAwKuU12bVid2+8O3HIrYDm3QJuMaw9dcUz1zBp/b58m2ySMUxIry
 OmbLhjKPnCb176hrwm8czzfZ2ogjM98GcGp5N8xKOI8v+yLeou0zmlZqpYBNPuIeOm+XQRvgDOY
 zUdK7fIEB+azXGFxEow==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af6c5b1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=zf4sTP8QFhBXReTkVZsA:9 a=QEXdDO2ut3YA:10
 a=pwadHHMnZuEA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMiBTYWx0ZWRfX1GPF+b0bLRIZ
 k3V5B6XHEDtFKEVTzZa5M7E02KfmIj8Eu+GE1E9bOKRkDqf4f36Qea+gsFt+0VSd/hS6l1gw0ua
 n+cPnCNM8pAGEvovldnNa5BnKuDdSKk=
X-Proofpoint-GUID: 16_HYOwpB2_NWuOrujkorFt6U0McQkE8
X-Proofpoint-ORIG-GUID: 16_HYOwpB2_NWuOrujkorFt6U0McQkE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130032

On 11/12/26 2:32 PM, Erikas Bitovtas wrote:
> Drop unused vdd_cx_wlan label for vreg_l9a_0p8 regulator.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
