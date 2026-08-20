Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7AB3D902E
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787213619; cv=none; b=pcXZf6eJxHyFP0muyYZ/Ze3hCnSCQAC7+pnMIA76SSk5K89yxKdpPqQBTVvpEjzkT+911XrZPJspSXUIfnMbeD5r7YPK6apQlfFM8SL85pbFJldlRsWb5N9qnX+7BXER8/kiL5pM8S8/Eg4EQeyTwYEEWyla/V4XhjarOSNeVuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787213619; c=relaxed/simple;
	bh=o7y9i/st/OyyyYHXaxy+xTSHPCgHCDfViDGCUPeHkco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/C7axd6aajJgE8zr0othLIc/MzyLv9n+M7e+ZIu8Y5/TqCA+kvs0MDJB3K3utURxzmN7V4X7bWK7P4C07Kd70S3Kl5rBrkGxmg7oDinw76ytO0BRC8gacq6uaUmPG/dt5xtpHXzmrrb91YqxaaV+EeYwlsVONuQh2l0eDL3O5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSPhujlZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FwblgcuV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSPhujlZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FwblgcuV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6IBRf1006247
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lSlQVMQM26yZB8tC7ntmn6PmxjJjFOHICmalvEJDy5E=; b=YSPhujlZn/CFkduG
	MianceK8oKZICwNFFGRvwFaz+DONxfSjDtxJ7j/OgqpS8PSPIvIujWVGgsY33r+a
	bDrWaTPijECg1tKLYMlv8RXiWpzHZmPGxti4XqSZNThpoSJBX+DxyPufMz2sX05/
	GVk8/rb4tVOmRtPQSY8QDV4ypI2a7TmFXcH8+z948l7N+mzT0deoDRRkqgIIL5yc
	+ka4Ftjdi365jXGSmLfLxTdCwMbf60ZyDtLut9LxH2G1NL+2/+lZ5rafH1yNVPQ1
	mbWRhHMn0F6ufWubwcVLmbzuo+oeUQmsaXKXvsSkONrEaZ5RdU1TZMd6iNuK5D32
	CbSneA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esc3u44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:13:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c9d953b71so566351cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 01:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787213616; x=1787818416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSlQVMQM26yZB8tC7ntmn6PmxjJjFOHICmalvEJDy5E=;
        b=FwblgcuVf+AQwXkQANeYAxGnJhXtdGU8OnX/mBtT3/jGLVnduuSE/NulLhUOLpA0hj
         nujjgQyogOvQhfRUskbPCElUPuZ8Z0ZOQ9wULJN3qoHrGoiKU27NB8e1OcPmatD1NZAk
         AErKAMBg3jeSL5cWP9gPbW/gszxj5voTF83W7zGDqOZ9X0O354GcXRDleTATxI/fG4PJ
         X9Kk23jTvujBjC8IymRReZklhZABKjv/IYdgAtgi4ra9P/MshaPB5k4kqbRSCGxdSvdu
         JRNcwoZbQ9s609lI476QuowsswEu7nxPFI7MaV2JHSroyNlPVvLlrK6/WWLx/d64oOEg
         zhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787213616; x=1787818416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSlQVMQM26yZB8tC7ntmn6PmxjJjFOHICmalvEJDy5E=;
        b=SVp/5CHJuSaqRs0mMJX0QfsgNUXGiujNScT/YOdBhRvFcPfT6jWO/ooATOvJzO1xA2
         v2bPN0Q8odewtdJkwLgHFzzUBpI9an4/uPas+fWhbXfc9ADsySe4JyfydOQIQbezMehJ
         XzeBp0eSddNapO8NUyk4Yhbvjekwg4ewTGmnnU4k03SoydFk116om7bTeFZlHC/b++nX
         y8t/HwytHJ9486OXQYDosDJW2FkHcW/k595Hqd3cGq7Fqjg7CJUbFf0rq46/Ot47OeAV
         oqSoc1o4aTsxDINpNeFrMSeVDyhP+Ke5nP279z5ImuCD/MicXhxZ0ykwLm3nlzt2b9Dw
         1GvA==
X-Forwarded-Encrypted: i=1; AHgh+Rqea7UO4oOfnYekOkGixelbq6QYNdnhqVtmBBmfe6sClSv4VyJClVMILdxIPcrbNJFtXFjY/ek8+C0E6Iiq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0FHdSH+qQzw8BRzbORD+w/dZwkXg2z+gCc6IX0a+q4cTpow60
	GuILuvo9sVzmbYrLLPCCYqhb4tMhtvRJC6rG2Vggj6b4bHGHWs55HUlu5QBkXcvStR7V3eQ7jMO
	WKBUk/eoEZ+7SofFAkxUYj7ErSTXSG7Jc/KRrEfz3ipuYaSag+u49ku5P/gToblVkvOnL
X-Gm-Gg: AR+sD10ObNWs70KIKdeeovpaSAGzOhrnHk1pdfE6DVRUrzx6ssOGU/QEbwncKwYCXkE
	19lwDMqErPTt3zDZwl6Qx6J8rgVTiScgEr8JWwBpPDi/MazCK8k4YVFX7VCJbDOSCtpA3nFawUE
	I7JO1ynTXSW+53g4V8Zy+YdoXIBXHQN2mb4x/TvaOHFa3fl0qxtPUo87uHNntVn8eIQrIsXawmU
	NfzbZLHa20Nv/G8/eMnoHNqdMSef1yqbxgWsAIhgVbKDz5Fw/1hDbWbHjqBp6j2cisTtCoQ6bEx
	V/Sn+drPp+viNNzg/gLfGTYiW17l5u9gSJ3K8p5t8roSLkjncqHet+Sx4AmDPIW2m+e1JQ90yzL
	IYn6NDCJ/O2zOnajBsZXTy3zM
X-Received: by 2002:a05:622a:588:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52dd5771811mr72169481cf.2.1787213616346;
        Thu, 20 Aug 2026 01:13:36 -0700 (PDT)
X-Received: by 2002:a05:622a:588:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52dd5771811mr72169191cf.2.1787213615953;
        Thu, 20 Aug 2026 01:13:35 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459223b93sm38324266b.61.2026.08.20.01.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 01:13:35 -0700 (PDT)
Message-ID: <e06004a4-4ed8-46f4-a949-8cece1348ddb@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 10:13:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: disable cc_debounce_dwork on
 stop
To: Fan Wu <fanwu01@zju.edu.cn>, linux-usb@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260819161950.77858-1-fanwu01@zju.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819161950.77858-1-fanwu01@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V_w-Cqw3qDzs6RnxBErskC59Wu0-9L7h
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA1OCBTYWx0ZWRfXwM8kPoLDQZtL
 SQpb0Ptfmhtg5syMij0SV1UED2+XQVdtrXpiIxM8GgX3c/HLuSkoEiYyDyGMIKxW8CEMkgV9RlF
 J6Y6ZryUf+M66FIELzKpGOtT+7tLlJE=
X-Proofpoint-ORIG-GUID: V_w-Cqw3qDzs6RnxBErskC59Wu0-9L7h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA1OCBTYWx0ZWRfX0iOrmce8W0i6
 2t+azJm57+PLWAfmBZulddqbr6ei2Jxbugl9/6CmM8/mcqG9V1khI1BNfVFnWhDxby8WJe2uI2j
 xF66b6PaW1fKCjyyh5MOTTgQDezwEk400oab/ZQ7n7NX1U6AMheKcaghtOPe5En06QX6Yxk5ZPT
 /jn04LcfSkEp4UgRsEL9fH09EYHaF66nCXJ4l18I/QdZ8Ifd1lUupbi4L7dYBWetpu8rZIK04AU
 VDSBrpUqW5hYLJdQY2Mz7zTcR5/No63Yn9bdryK38PUq6pLqACDws/5vL4UWL3uP9LnoXyJMnXb
 4ztib7PoMiKSf6T5/NRQHf8of1MtsLeFQ8fgAXOT0451jw3cfvjJQ8nSjIEkHvHYmCHmVi4qKkf
 ZyQ421HqHJvxdLXV8xAxE0s61xKx/JoXG55Ag21/THVl4QDRpoEpPEqVs+fdbLQMfVQ8+BPjbQY
 Wqie//68D7OyTDfMbeQ==
X-Authority-Analysis: v=2.4 cv=b6uCJNGx c=1 sm=1 tr=0 ts=6a86b731 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ywe33jvvH3eccHNFifsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200058

On 8/19/26 6:19 PM, Fan Wu wrote:
> cc_debounce_dwork lives on the system workqueue but is armed from
> tcpm callbacks (set_cc/start_toggling).  Those callbacks run on tcpm's
> kthread worker which is only destroyed by tcpm_unregister_port(), after
> port_stop() has already returned, opening a potential race window where
> tcpm's worker flush re-arms the work.

[...]

> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -694,6 +694,8 @@ static void qcom_pmic_typec_port_stop(struct pmic_typec *tcpm)
>  
>  	for (i = 0; i < pmic_typec_port->nr_irqs; i++)
>  		disable_irq(pmic_typec_port->irq_data[i].irq);
> +
> +	disable_delayed_work_sync(&pmic_typec_port->cc_debounce_dwork);

Doesn't this make disable_irq() get called undesirably?

Konrad
