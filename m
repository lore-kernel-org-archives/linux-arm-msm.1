Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C0B3D1CAC
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784537927; cv=none; b=DEbYckYvG00QC0N/lD4BEpKWcj+vM1wgQyTM71dK85c18StUJoos8xMybfycK67TMj+/GhzxokpUk/vqKhA9Iq1Y/yzawv4EHrYiYN/k3lB6I58lIKKjOw9ihWqEx8riUCQ40/P9PxSG3fMydVVrfpl2wTytJxpTAJ0qBUyOV98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784537927; c=relaxed/simple;
	bh=eELYxTfSAfVlp1pEJBxafdKzmI6BhbebsXeruvdqR4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GNrwDiPKtQs3THFoXktp/GDbZZNglLIyhc0WYA7rifmxLCr4gWDe2JZlUbHXiSIteYwqMtjfs86zXJx8XoMbcoo5tyrff23VU84d/WphfRfQhrQRUg9ibieuacmWZWh1WY3K5im6VvJepO53mXTN2ZTj/1iqJBUbzwCn+xy41Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/1DIaKt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GxnH3zFo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/1DIaKt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GxnH3zFo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K7YNhB2044270
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JvSIrCr4JGC2VKAJ7NmWV1QzpcOUoKgTr8ust5Zgc0E=; b=T/1DIaKtGF/ywqZP
	uwV2LRTQCdYWKg/TExoffyarKzYh511lB2DOHQRPEVWB4ZdlGCbcVBT433lLpMBs
	lW75n2aLXjOfGwd6Or7zimWq0vfEja96KvZWfNgZ/35MhUsKnNKJ1g4qlJieH1lU
	ulKHawJPqSDOzUra/Zkx127f7Si6pxm6o+LbbdKEF3V6fHv4AkRRcCaxKaqJG7rp
	7xONyzwaQJQJlgTfEpEPfU029Aj0h7XUvo6TwvsxAA3NLPh0WlZqtiGewOcf2r9X
	jjFlPHw3MkFSofFU8HuA0rkSAmqarHR0au7vQf+cXByRXkonpjyT9ZBAtDP2facF
	8Q3zKg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdcgack-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:58:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07313be5so20001591cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 01:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784537924; x=1785142724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JvSIrCr4JGC2VKAJ7NmWV1QzpcOUoKgTr8ust5Zgc0E=;
        b=GxnH3zFoLb8OJixvJX1VvFVK9AFAZd2RaVhXSbrV+sz7QoImcWcBIuaTZ76HvjrKEN
         3J8LkiDrZYAKFxmptz4TQ+t86RyJqfuTHfI3Bne6YXN+D1xKVPXzENQErMjyOIkq0azt
         o63xnT2ZIPiavJNBU6OiYC3xMPBeZ0Y7RwAmFLZY2JIgWHo011tonxi3Xu7VpHaTEcVf
         aPsw7sbm0U2wmpZIxTEp7wBcx0M8VUURgy74U0uu8YCkn7tmUXJ8WlhnBErrI6e7Cf9x
         Uz8Ce1C/vT+cVr4BC15Q9B3MS7ABLeJhy/d+Qmouyly8tt82aq3y1h0uz1OLCkez3nv6
         Fg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537924; x=1785142724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JvSIrCr4JGC2VKAJ7NmWV1QzpcOUoKgTr8ust5Zgc0E=;
        b=ciLpReeAYB+z97EIMfPaKdq8GmTMgK8aKcpTuTqPfnnAJOEuPF7SDnoJno2vW6e3Rd
         hG9SQRKNIl/fP62iX+hgn6d/qxwHRSqseuUM3VHdkacMw8AqngBpQ2CfAwpwACNs/X0+
         4MzqFh1MEnhtaZS9UHDYRHl16CDs/GgHgVjHobfAe2BashmXHeeg/oW/G2Nkg69ANmDX
         oj7xFdxMiqUa+TMwFOsTWsVGEpbbhp6+yGqCZTgNMJK46SoOowvBcAdwUvrb3CtDRkFp
         SQNXvc0I6ylcui7slubw1PXwL/XqknuIhvNe6vhbMTMKo/2Z+RMbugx2NzzjzqOkFmR7
         cP+w==
X-Forwarded-Encrypted: i=1; AHgh+RqQxyC162kPUmPzAL14IalFyOQ5RRN6+7N3eKRufoI43OLRTIsCDEKlg4K+5gZZDDB7VJtwsTZ3t/1TCRUd@vger.kernel.org
X-Gm-Message-State: AOJu0YxmrPwBqW7DT3hyzvSRo/6irTJaVkH/1WQuXCeaMAU0bXNnLW64
	Mj0xobpE+C9KuRizIVgIB+RQp0bSmBcgxb5YPaDPeNGqZkLb785Sor63zLiFtFOWEFQmfGqztBn
	NRdgd0OD7pSDr1sQlwtev4NfIi+KnsCp5aPsqvBh8NvcULJSoCJaWi76NBDWcMW0v/VeU
X-Gm-Gg: AfdE7cnW2zjs1+mdrwPI1p7S/YEZ3nj5iLr41BRH2wXJzwve3n2N9D+Bmhg7fSdfl6b
	PQeBwGwKjGRdSpYn/3mMbU5JNjOMLjoeq1AjScTX3hotKqdtDBSei46l/n5HwaaAEZcDYYsx1FL
	JglWH6AgUburIeWbi9hw9FqVbM6Wk7cgAIQ6AG4VYV1/njxVOwRH1yCzJSsJ8OqTx/esXLaPbL5
	CbM3SnuljghbxgbDQWaUSl4MAZUbtAgcMYfyZ7s4UGK070vdKUroJmAm0qgKjFfvOcliUWyLd8A
	h9hnQY77F43oTUIObJ1kNcJdMWy5H2wq59QmFGHv95O2pCQkRef3VA1Ja37PxG8nEVbgAM597El
	C7/dKUGAqTFU0q/QqDpnSVPka
X-Received: by 2002:ac8:614c:0:10b0:51b:f40b:2faf with SMTP id d75a77b69052e-5213b633e1fmr74571891cf.4.1784537924585;
        Mon, 20 Jul 2026 01:58:44 -0700 (PDT)
X-Received: by 2002:ac8:614c:0:10b0:51b:f40b:2faf with SMTP id d75a77b69052e-5213b633e1fmr74571731cf.4.1784537924247;
        Mon, 20 Jul 2026 01:58:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c19457d6f0fsm386519666b.36.2026.07.20.01.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:58:43 -0700 (PDT)
Message-ID: <067f40c3-f827-4678-8d1c-25216d3b4603@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:58:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: Add Kalambo CRD
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-3-a1069b5a2757@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-b4-kalambo-crd-v1-3-a1069b5a2757@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TuNMNhZ7q_tB1XgsUWqyaVVM_iMCLCcP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5OSBTYWx0ZWRfX2hjxQttp5Jss
 eQz3uWVlxXcY3rUVMWPjMBI62Dgbh1gAxJ0MpeiAc6RoLvxuZJjS+ZhmE5qvze6aZlFST35gOB9
 6zuLx6XJ1DGDygGHCYMpdw/IAJ6G49y+qbtTlQ5HF69yyWWzZpU+hVlMvEf1dMIzCjlfByYUfYQ
 4wa9oyok0TtmGkHNr+eTPDsGZqsAgNWc3w1xNHCQYVIPRoj5PpxJ51ETsWq696lrw7ydmSZxdJ8
 XH956l2vFn4Rhdi4eVzlXZ5lff1hc/wGfjXJ6qw42SXglKG/5ooq4LjJUwJ0sANPW5vnehT+3nV
 8QJTIhb3QkgxDGJUonkuvTMJD6QGbc99kfiiwx/udGwGCrGlsB0X8fmr5L22pSUz1KWO6klIW25
 fc50VJQsGPJeWCR27USN2CZlYmTo8W7vAwiXSzx9iKuLsL0qI9KvT+pQDaQ57vVfNzUtZvEEG9M
 jrqG3LBFMtetgDzPhaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5OSBTYWx0ZWRfX8dnHlaNII2Ra
 MktvimAadn8FiAJHvtuK6PAIh8KLBXtiuxcvPgqd6VkdxGZPEAs+uFzNO7HttzRM42wWV9gw6fk
 jMRRfCteveTUjwY6fF9+T8etmt5WQCM=
X-Proofpoint-GUID: TuNMNhZ7q_tB1XgsUWqyaVVM_iMCLCcP
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5de345 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Hkh_rGh67Udisc0sesIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200099

On 7/18/26 2:06 PM, Gopikrishna Garmidi wrote:
> Introduce support for the CRD based on the Qualcomm Kalambo SoC. Similar
> to Mahua, it is pin-to-pin compatible with the Glymur CRD. It reuses the
> common CRD board description and drops the PMIC nodes not present on this
> design.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
