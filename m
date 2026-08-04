Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F03645C6FE
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 11:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842640; cv=none; b=kZ8nSH5MigAF6nwqaMtf0rxHwXjme2q7ziscSCGBKj1Ol2SiCrKwGAWPTz4jukgvBO74GP9aRv0heXLYh/FRYobpK8kBOJxwULZmprULBfY5lElstDFyV83cbLzhO864LwzNxmYIocJmQzPJWRaq0voEoGF1cFu1ihfQJkWluyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842640; c=relaxed/simple;
	bh=dSqYtsfKFijnCsZOZ95MAlgSqmBheENypsz4hHbUyh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTjs6+3ZDqWQObaHLvGXFwdoqRl9+173S+ZkeVZBV75l4sfBeoLjpZLt4qnsgv0pCFZvmsbiZIEgXtqUik40fwLyrQHK4ehDBDbKMjiF24YddYQV7X6t8fkV+FmfVm+XbKpvoVbzsdbRsyUyNWfO0Z32f0vlZ13/7O6Q9K/7cZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSzp/OZz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bE+RH4lD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSzp/OZz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bE+RH4lD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CFo83034301
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 11:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z0kUAmeOvZB7aq8PtBEq+wMx
	JDgcUdO8yHMNm6TSqSk=; b=pSzp/OZzOLPvvX8qCOl7hxQw8WODYbzWyC7avT22
	/vLBctRDf7OW+L8cMKXa5izb62xlTCrjp/VW1O2QTYtpJvOKeBBfIkrWKXu0qYHz
	dIvHoNEmp7FWDKpouUjo8eyS562SK005iHHN4/DD3vTEeD45F4LlF/sfXQYf81ul
	bMOMZ6egnuAA76Pcz4WTTQE0D3KxFE+8JZ/KQHnw2t3UnACPJp8rdYnbHD3AS7+f
	1+q6gUc/Z7vMlJi7cLpohfARu7uXk8JfHODNAYsMCIBCXBt+tXAjLaI9yS/098r9
	8NMqhNOdNnvUKdPG0Gc3iuCX9qmEfSOAnAEOyH1AJACeMg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3qm1ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 11:23:57 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so5972435a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 04:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785842637; x=1786447437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0kUAmeOvZB7aq8PtBEq+wMxJDgcUdO8yHMNm6TSqSk=;
        b=bE+RH4lDvxi2tkbYHI2r5iJjPKkl6AuKEAxpR+yJfpQYjot3HKMnHPgCPSgpQ1k+lm
         TqOB9Ji8spnknE2JQnK6H8X2TesY7kNUxkoZ1u1E8+7zfoU0+9XlLoyQWW8dVH4L5Y7m
         cKBynzoV94VQT8umZbeEQVQW/Dbx3ce/qu5/qt1BWw9To7xMsmFbM/q9X4zaCYY7nTNP
         sSEffEBph/omQ5Yz5xXQ5anShjqzgVn7DOCLEIUmC4K8L17sB5gwEANlEUVx6iI3ERDr
         jeDhkD0EHMlgstqBtAHOHIHi71ji9sIDCE60Qa8gS+pCNvl3tEY1klscqwpfc0xajKKp
         VrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842637; x=1786447437;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0kUAmeOvZB7aq8PtBEq+wMxJDgcUdO8yHMNm6TSqSk=;
        b=b0KxSjbpUjYkSvYtoOjNK4MWicK4fZn/TdWPMr3rogIGk2mE59Wi8turxP45EwG8gi
         k3eReb3JACiaQbYZJa54p7E6ugyWuTOxm9OrUi5ESxVjLHpXqMnd+Uxxl6RBp83gkHyj
         yrpaUSfj2Hyx/Pmi7TQ6wOwcU1kGBj0zY7sX19eR3EBzMQYGw801f0TfE4ViQMymrZ6X
         ALKnaxv7B/GsE9bQo7kuf9kwQk933Q+llusMVJNAomtjDNWlTKCd4D15ItISz8TNbyf4
         bli6gXE9Z2wHYKiERpJeXZSZizR+2RAfxjTz6/psNdIILChI4fVUFCr/GLap0wNiyED9
         fSCA==
X-Forwarded-Encrypted: i=1; AHgh+RqhsfKQHw1JPNS1GFN+e4tg5IHguElEyOwN4VXL7eppixapqm5YSFWqZFEF2McTRN0ePtHHievTXdO2yLIR@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ8sL78dkhXSMPA38FITFKaeyxAYBJTWNvmTJFRrVZYF3Nt0/W
	7tvMP5ctkwNVYlx/DKdhDhWEopyoIkVBvdhhhCIcy+2nlYI5Ho5RKcJxx1VDrKT4JbBClyfhsl/
	KVwHfR3cn/HQMdzohOT92uu26o/e9zKtSD7OBCdHUAxhxFOROtaVqY8u/7JhC0XveGRcD
X-Gm-Gg: AR+sD104CWlNbj9KLs1cPcWV6R5OF2DX6bXksaqqNtJHUm+vipoVqp1+AzZ7PdT9me1
	QdUmy2fmLL6PXXkDNYW7JKUBVhp661zmQZ1vMA11NKHTm5XEG9ZQi6nSzyHRlIBHcanxap2n3hX
	rbuBS1w1sUAOkt3lI4NKQTyzjXo4UiEv+wiizN/4tg1lYPZOpNpLszZErMZ4wKOf6C1fvJR3cE6
	sOelgvXnkCUv7EzPCyfCO/N05AmGW+Wf8Q7LQQyYS1ixDR0Sh1k+Ac208uxibMh51N3Oxuy0wGu
	lc7ViaTwAWHTl5ho+9aKXDlGjyM9UU7jNt9qGs0bUpcZt9Ho07rg9U5cMGCqSnvVtWxVx3wN7uY
	u13I+rpHBxBl3dgKV1QrepsHjpHLJH9UKUpAhdM5PW4vQclHMfizwm9Tez3QxIMJj6vDmgfoiiy
	ilbku3fgQ/RG06a8mpmIgsgPlYrtYxog==
X-Received: by 2002:a05:6a21:9cca:b0:3bf:6c08:fba7 with SMTP id adf61e73a8af0-3c92a84ec9amr14379025637.59.1785842637189;
        Tue, 04 Aug 2026 04:23:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:9cca:b0:3bf:6c08:fba7 with SMTP id adf61e73a8af0-3c92a84ec9amr14378980637.59.1785842636763;
        Tue, 04 Aug 2026 04:23:56 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673be4dsm5730394eec.16.2026.08.04.04.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:23:56 -0700 (PDT)
Date: Tue, 4 Aug 2026 16:53:48 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Subject: Re: [PATCH v14 1/9] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
Message-ID: <anHLxOdGJwChDnEz@hu-varada-blr.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803-rproc-v14-1-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803123537.utocak6hvhl5ijqh@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803123537.utocak6hvhl5ijqh@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-GUID: 6g5hPVHdwH81PxiJUV_vfyQRq4oWyWX7
X-Proofpoint-ORIG-GUID: 6g5hPVHdwH81PxiJUV_vfyQRq4oWyWX7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5MCBTYWx0ZWRfX9uP+4kotI19G
 TazNdBN40QsqF3JExJd3Q3yYqCgoPM6Eq2dE64FtqSqMlW+PNhYNtMJZTblcMkVYgZa1U38dajg
 ZkbrEh/L29FdnLk+wLYjGCkF8oLUHxJDJ0i+a2IPPyBM47owLV7E/gClVPu2r25QkZ0/uu95eQ+
 4WVbCWqMEsOKzyviLUFjlaamamTvAX6UgehSzk+Zu5Op1KrVtsEC0rrimp9xe7l4yhKhWV4g+B/
 LnHaYENg4vX1Xeo8eMC1Dv06ijHSP2PPk/f0XTTvOCZ9We+V+NECHya4dNRzGcUG3r02mT4sKyo
 ZdJUDOoUKJvMnZqpEOEO1ILu9cGWrbraRiRhA8xyjTBLOb/pHU+1xK+u9IsHw+tLCyLDb/5vlCX
 LTafFf5lL1OcfhVMu6hKSLYR90z1w3bM8bEpYiKi174d1H4GL5F1ZVXDvTOdFr1j8ZVjfIuwaLj
 dR3i/FDoczvikqI1BUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5MCBTYWx0ZWRfX9HAuEZ8YY+e0
 YNyt/PwYcJb10+NYR95sDKQf0iyXaj7Gy8fNEEgp+5GiANH04zV2jiwNfhKrYhHZWt4qnoqxEvj
 RVEApiVD7YxuNtvtFfVUvpqZgU3S/Uc=
X-Authority-Analysis: v=2.4 cv=ONEXGyaB c=1 sm=1 tr=0 ts=6a71cbcd cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=W_EDbNz8WyltxIkMcgYA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040090

Mukesh,

[ . . . ]

> >  	if (IS_ERR(gunyah_wdt_dev)) {
> > -		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %ld\n",
> > +		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %pe\n",
>
> stray change..

Based on AI feedhack changed %ld to %pe to print PTR_ERR.

Thanks
Varada

> >  			PTR_ERR(gunyah_wdt_dev));
> >  		return;
> >  	}
> > diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> > index cf90a565fdfb..e58c76aba45c 100644
> > --- a/drivers/firmware/qcom/qcom_scm.h
> > +++ b/drivers/firmware/qcom/qcom_scm.h
> > @@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
> >  #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
> >  #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
> >  #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
> > +#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
> >  #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
> >
> >  #define QCOM_SCM_SVC_IO			0x05
> >
> > --
> > 2.34.1
> >
>
> Otherwise, looks fine.
>
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>
> --
> -Mukesh Ojha
