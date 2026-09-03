Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A383A1CEA
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427506; cv=none; b=cROgWvqRQl0KDsV7JaeDgQifMQb7jlekY0e9e1cwT3ocopyE81RdbRbFC6WPXjLIBUwiD2fj40KDpEPQ9LguyVyfT7c82UZYnmLzfjpW4BUeIAGOG0Gb164R2VBY1duu01TMxEEgsWSNcSQDwdbS3RmKTFnOkr1nUL4PsTio0qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427506; c=relaxed/simple;
	bh=RiRPKZ4Osm1Mw4H8A9BJtRFmrn18N3a1wk0pyf7knds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBP9h/NLFWslozwUibgbmRbXGQ21vL1Uipen9MBhlEACdGcL7tGhKZoYS3MsyG5Qzv57cTZ0T3XdOJItuCa4bQe9tBTgZOMm96iDmJbLfiDh+RcdtJilTdFng604nC8EV4LLO06mlPAgi1bHjByCjNwORotTuEZ/yFscvrOEvjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRG+5lNP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtKS4M7w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRG+5lNP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtKS4M7w"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683921dY763902
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 09:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p2zs+3Jz7pX/zIdzWNa3k21r
	KY8zg0lGnI8endphEcg=; b=GRG+5lNPD+iaZtxwT0IRTdU6vyDjHfl3ZZ1hFL6J
	Hp8EDzcKTqVa/usHgo9Oy68mlPX4A8tuxR5JbGtIiKYU/Uz48+hj0NMEKVW1kXkj
	Z3qFbUkat0qD54DdjrAlrDUQ2kqsOpz4eoUqHdB1nQN4aExNddWZpcqIDindWlVn
	+kADSMx+myX9qdghobH7Kb401GSZnSnOejdbnX7Ln0p55M1KrASaheTj9UY9lcut
	QwLxOX7E3hCLO9/YyOOTRFxizI/zfs7oIeQ8m/YTXJfOu/hss5Ozb9mx22121kcF
	xt0LACAbXfC4Nq4mVA7XVSNoO6w6/7S7qO23G6ktewselQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnbjm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 09:25:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ec3146553so594822585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 02:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788427501; x=1789032301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p2zs+3Jz7pX/zIdzWNa3k21rKY8zg0lGnI8endphEcg=;
        b=YtKS4M7wUe358OuGfBcaHqPXqKnhmEH6CodV6nfeiloAH1Ax8CYWnjG6Oq/AFoLjAw
         jNNiRhMnJ9c+S7I7BijIVHw2X8p0Mt0RrEuPzq5JCTE7Ig4gwL6Sy2uhjiJvoqgG8Ix8
         jbt04U5bs7SW6T6z46ATc6vVSja+4jbnUmdDDSAWDEMMht95R5lvC/QG3sYxvapzAaa7
         b+RmoH/G+PzuhNDWzimvJXQes+L/VeTVpE3R/mruu0a8rgtcrOYzD6ScsOpsPlyZA3y2
         DMxz43pce85UisXhQnsx4cakIijOQbSNGxDRHF4nj5hRXNE4wu+j3R2zOCgJ8kl3EK5U
         jijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427501; x=1789032301;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2zs+3Jz7pX/zIdzWNa3k21rKY8zg0lGnI8endphEcg=;
        b=Ja+h0dTGaFd4vIZ7gE+g3mfQuAw9LbmGu27xuDHAdJwYUiDPMNviC+FwnsP+9B2A9i
         gyQ3AcJqtyBHTMvN0YxftSuQvfSt0lAihk2Ab2tjYPWQKy4mfQ3cDRpvFj7g71DavX8a
         5B3lAFNpzgxteAUDtNtMdtH3blBcFCQ6VuoMlFU4/q2Jmu87O1sDUL6RdSE8/xti97FS
         hCWzvmXQ4UpifJMXMBM2F7XRUnyX8XMArfR8Q8XvzHpBxu05DqFUAyZosvtKKuzbOKk9
         0Ucw4+6ldNYZFkomdu8sAKCgk3XzLauQMrI3fWTIOuM4AtiXa5QkFD6OX+DfFAOMYSnI
         y4nw==
X-Forwarded-Encrypted: i=1; AKwUvByWF3NwhQ8p9Qf4HDjaKmpcfaGURhU/rMGsxQe6yWZaDzhx91hbJYXY8AoppxixtYebyynIugPLoGUD/mOQ@vger.kernel.org
X-Gm-Message-State: AFuF++lE26cHtOiShVB+2RFaWzj4ChDxcReB+CjoQDFvwo1VCqOzeqII
	o4a+0yEm+6uGxdkPODKTjkIGtNna5DhOFdGc4BIFtxVEVF6acyrcADZwBTQDQMMNXNjDHGFuWQO
	/oBj/5rkHuwDRViXTE4teEHUxk93mHtp+vqvJoS/WKZ0iq/nfTT+0mhs0W5+f6MeEjrD6
X-Gm-Gg: AYBFou0Gn1oNs4RfEGIy2FXAa823LkJungrDY8n0MfgBskpXuYt8fg7JHF0sfe0680h
	7J6cOmKCUfJYAPWHnvUC+O1z0F0tU585f93gOsrbCjX8tNOHF7zq0ZUM0Q/eC1qNpCzpgb8d1ba
	GxiAJpGL+YunKjj89d/SfjBhuNEUhQ3eGKDi+YyonqX3q45YmMtyy+dPwoPxnluVaALjmFOEc+1
	hYBysu7Rl6aaEFYqgEymk1A93R0dyW/61t4QEkPScAeG2Tc5UDEtHd0R1wTfIoShX+x/3ySoY+Q
	IisikWJqE3A6aPqTDjKQ67+KSZUyIAQnipjIz02HR3C0+9RCAUIGbfyCOtfePd44tAXER1m+AU+
	lSyo1PQplT5hkNg==
X-Received: by 2002:a05:620a:172a:b0:936:dbd7:fcb3 with SMTP id af79cd13be357-93960f15d45mr1244545485a.21.1788427501230;
        Thu, 03 Sep 2026 02:25:01 -0700 (PDT)
X-Received: by 2002:a05:620a:172a:b0:936:dbd7:fcb3 with SMTP id af79cd13be357-93960f15d45mr1244541785a.21.1788427500797;
        Thu, 03 Sep 2026 02:25:00 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80798sm11791479f8f.13.2026.09.03.02.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:24:59 -0700 (PDT)
Date: Thu, 3 Sep 2026 12:24:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] remoteproc: qcom_q6v5_pas: add per-PD proxy
 performance states for Hawi CDSP
Message-ID: <yr3a5y2m3tz65nag45fgt5urdshpxysvopp66chwcjn7l5d5tl@kmvnvtexyhvl>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
 <20260902204334.2061226-4-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902204334.2061226-4-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a993cee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=a2r7pnXXQew0X-Rri2cA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfXxq6cEBD/e3YY
 cs5O9xe+A6RVvOrJov60+Zb/yrrkycQqiz2o23m0ahlNoIKzB4aab4c1YHgiEfsvARmSnCvqFRP
 /LQvMfN5g5K9F5tZ67nIr640zw9PBEw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX1tB1QVbNsmd5
 hDTzkUE+GiogGkWkly0jgH0JdM6gEmsDEZ+DQlxIz1IT6y6bcNMIczex7WKo+I9P/Fp9m9eR+Un
 AYy4ukqg4igUtCDVAnZEN1ZEbAYmwXDzbUFW2ZD3aYBPzHIVGoF0fkEYE4BoumCpDzT1kPjtDSx
 uA53s4XejghbL4lD5gILKDE4iiM9SZqK0DYBiXqdr0AeqmIA+0H6rkXwyR5IhmNU+XGuKxF3cn3
 1M4hXqoZEcGq8vN0fNL3TM85s8XmoFqxh38vVl+gZa2hVShwWKl0OWA/PDMjsJrK5geWXl8dWt5
 9vfPt812Z6IWIJhLmbYKEj2YulNLavtPRikvrz1ERh7Cz1VRftqJtjFT/FOizpUwsnt0F+00mB7
 LJU0hcdHBEiQZW8PQ0kqpvnrhHhWsqfQTVPjw3F6aupfituy7GD6MxrRBhBMmnhnSmGqWCtZgQ3
 sXr3+uk8YXkDJmP9Ivg==
X-Proofpoint-GUID: miEF2bBRJ1h0ahGAaNu2XS1NlZwBH8og
X-Proofpoint-ORIG-GUID: miEF2bBRJ1h0ahGAaNu2XS1NlZwBH8og
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030080

On 26-09-03 02:13:34, Mukesh Ojha wrote:
> The proxy power domain enable path requests INT_MAX performance
> state for every proxy PD. On Hawi, the NSP proxy power domain's
> RPMH power domain has no OPP at INT_MAX, while CX and MXC accept
> INT_MAX, mapping to their maximum supported level.
> 
> Introduce a proxy_pd_performance_states array in qcom_pas_data
> to allow per-PD RPMH levels to be declared explicitly. Platforms
> that omit this field retain the existing INT_MAX behaviour.
> 
> Add Hawi CDSP remoteproc support with the following proxy PD
> performance states:
> 
>   CX:  RPMH_REGULATOR_LEVEL_TURBO
>   MXC: RPMH_REGULATOR_LEVEL_TURBO
>   NSP: RPMH_REGULATOR_LEVEL_NOM
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Looks OK to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
