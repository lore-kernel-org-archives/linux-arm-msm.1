Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E28F3EEAC4
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561216; cv=none; b=CqrpgIewh/cx7RI1CMPwDGwwac1QUaClSwGFH6+m81UGTXxPjngZtwZsGgNC2OvWpMWKc8HljvDpN2LSzmn3GthYpIha5Z7G/1X5bPU7IzkI5spLFwp5HgFzSeKOazERvF8RlHJd8PfUZSWu9ooDVGWCKEbZSzH2JAOoUFD+2BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561216; c=relaxed/simple;
	bh=sX+wuwD+X+HIlWFprK9YR6qFkyX+Zt/RSmNQEjo/qt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hSuZNAzVtCCAtZiKdlGmwm1nHQcLL4CP0bnaTHJ6M9meEC08q/90W/fwUtedw7FSjWn7JI5ks/nEkzYKlVyiosx2FwpI2y83Si+1tCuxaZ54jxvg3l2QsindD40VtkbRaddE5lD4Yz7PrthFFz4p+CpdfWKBzEenkHAjyDQz/Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dPKL53zE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gvThDcyu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dPKL53zE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gvThDcyu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RCnO3066897
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sX+wuwD+X+HIlWFprK9YR6qFkyX+Zt/RSmNQEjo/qt0=; b=dPKL53zEuu5ZF8CQ
	5CCiIp3559gmOEziRf4UOGRZbtRpvIpoeIruOPCIMXg/heU4g89dncrAvOwJNu5E
	cB4ShB110c/23eAtBa81qTjxoL74p228Evhx7jsaFjIqQUuWzon+WZZvrKRrPaWT
	IkwmT2m8eSpXGpCh+DFA7mC/CP857vd2RozHJtOJbrg5ggM5HYaBnUOj8pzSwpeL
	VoWCeaSS4IJjnV0pqCcB1PIZmfByLLIXellQWslJXu0FPz4+jibEmfVtGNDIH7Yt
	WSc/mwvGqhgfRG/7vtJNM7Nf5yJANtGF3FiZhRSTeLHznmAUAytchz9mACH3ZVqK
	9zc6qQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jphray-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:46:50 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97c595d2130so25468241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561210; x=1788166010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sX+wuwD+X+HIlWFprK9YR6qFkyX+Zt/RSmNQEjo/qt0=;
        b=gvThDcyuZYewjKTFP0cM5qu0rEoz+pfAuBUuUJi3XhPGSOg0FNNn1VSPGZWzQD4sW9
         b5GDE0mImEPzeXi4gUXXrpw9QYN1LlSFcMP7JS3UfmxnjDhFOc40WZx0HdHrhUmzfbBA
         HxVQbhaU5UXENjzfatthC7trAG5QOJLOzfXIy4KLOF7STAq82/t/RAUbT5oAZdfnXJGY
         scA5Pr+L6vCjC0xwQZfXbB03EBh95GCjJMfLIHx4RmRAJrjdKkyOXuc9MJnBjZqngWgB
         WGrUCgP0h+janz2Wv/yp3V700E+pIWnDagE/mOUiKFtV83dUgiAnFxr260YiMiwRI2GW
         M/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561210; x=1788166010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sX+wuwD+X+HIlWFprK9YR6qFkyX+Zt/RSmNQEjo/qt0=;
        b=kbeT1Zh3D5FgbnPyUcwA1eREtfdK0ZtC5PMkTGRM8CECeYeQWvn4QcI39T2HkgQ77H
         UoszsjCoEhPoVgTo0v+n4KLF4ppVeNuNfOdGEwi73kwmAMPseOc7sqyRnVDwN8Tuby3m
         SExg+UBlNk6/qRdjcBHCmnJZidGFl/gBnfqJSkyV/iSZ5bK9wxJV/7x+okJgR798hlaM
         0eGjAzEDH9JknKCc1twHs5BsD7hdiiYP2dO1E7znUU5eYOtYixi8hDLB5tpui0MPGpd8
         QZyExUqDoG50xfwuPbI7DvDIM+arei/7kQbJ83ILAdMBmd53YM4sUIr6xtwadbV8bA/D
         RIaw==
X-Forwarded-Encrypted: i=1; AHgh+RoqXGL2A2JhHX+CH1ixt5TPq2ru68kUEHI3bIqBoPD/klw/CXeuphUgr6ol0q5fujkeiGfzmtOlyoWAs9w1@vger.kernel.org
X-Gm-Message-State: AFuF++kOWiZEInw1gfNOb2LGqC6//3uGAcfNbMTJ2Ga7w+xLah7Cvh/U
	Ja6Gki/Zfq7V4Ca1rElDsV+gZMDWBBexp+fzrtGBqmS1g5YX2+3Rr3etcwjWIvHUgZEZnsu0GuT
	nFeH0ACGrJYkFpTdl2kjTMd0zAAoUDBbntr3c9QGmoUCAzum8wcuib0rUlk4NgRoUoDOu
X-Gm-Gg: AR+sD11MdVmmV7LOLuGJ7n0/lmSFeUfXBg4/a9blP1rZS49+wHROFvRtJdZYVyLPtYl
	k1/YlDR2yYGO1R8HRNlHq3KkMy7nYoLshNpOgPKQshihof4YfZfT8aehEZeQFr+Y7L68gnhc5jB
	mxpWP0vySk/xX5U2qSF4CQm8IPSSQ3pmxHdLRSvWDahV4qaf6wwr8lC9wRYS2Aty0ztHWJptOk5
	SttFlwfeF+2iFsjx5n9KmlcpPJ6ShYEN47GhlHISZBD8ZX6yDD0iJCtMbTrMLuxRsECs/mXawI6
	FnF22KWaBOd00Wm3Uz2ojGzLoEtyAO85xO72oIUcyDePYg9RDqZW+Ltoi9OhS4Z5REg2tlXwVba
	k+KUA7CQ5pOxZ/pPEVNeYEAjl
X-Received: by 2002:a05:6102:d8e:b0:778:1bcd:ddc0 with SMTP id ada2fe7eead31-77a5f8ee1f7mr3580151137.0.1787561210061;
        Mon, 24 Aug 2026 01:46:50 -0700 (PDT)
X-Received: by 2002:a05:6102:d8e:b0:778:1bcd:ddc0 with SMTP id ada2fe7eead31-77a5f8ee1f7mr3580128137.0.1787561209638;
        Mon, 24 Aug 2026 01:46:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e2da49bsm8665454a12.29.2026.08.24.01.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:46:48 -0700 (PDT)
Message-ID: <578542bf-36a3-4cc6-91e5-fc5881c60432@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:46:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] pmdomain: qcom: rpmhpd: Add RMPh power domains
 for SM7250
To: Sreeshankar K <sreeshankar0910@gmail.com>, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, konradybcio@kernel.org, tglx@kernel.org,
        ulfh@kernel.org
Cc: bmasney@redhat.com, radu@rendec.net, abel.vesa@oss.qualcomm.com,
        lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
 <20260821154030.2514-9-sreeshankar0910@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260821154030.2514-9-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfX8SUr5sZ4Gp42
 T7W23ZOXPPPq16XsYWKE8GDrr/HmyAmJqP+FCHTPiQP3tVg9eJ1K1iCVmPpr4a9N1irzI4UITpD
 ug7L/Ue5L774UmhoroojlLnMX+B4HVGpg81zopwUg3bEQZ6IOInG5jiCPuxke0vbPivLIQnPZLX
 Y3YNuh8UecW2bofsc1IgC4baxnCbZ2QVYr1bpGFvgLUtCbd1wNH9Aq00CSFl9nrW8DCa0tCvITE
 FKLd6ZHCa6Fm0J/uEhbVIAtctrm/jXUn2oLmzFIWInEvDRNs66qF4F8ph0yDlX1w3h8dvm3u/ZP
 txsbZYYmxi4ZDqiduI/oS7eJ2WWBBQw2A+fR1sNWS4YfxNjugZuTq40C9Kq4XYr9nvu+c+oQylV
 i/Nm4sCHTa266W0FbwUjDW5OkOsX7IReIf+0S00zMP+uPOhFDft1L5s+OkBQtDE33sbqK4x1o97
 zyb8Pjo5618YdGv/CzA==
X-Proofpoint-GUID: x-p6l58m5ttWxJP20rBpDfwe8Pleue0K
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfX78iTSwtBeSk8
 uxWlOn6WBS/ESnnmGgcHkMVz3XSm9VtArJ0cwTAKCVfbvdSFI2k6jnUdc9UScIfbmrcaeX+xhtF
 AiYaaQeOkzkMXok7kGkIx+6ZUX4hLJE=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c04fb cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=0Fz9-S7UgyL-nH97HSEA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: x-p6l58m5ttWxJP20rBpDfwe8Pleue0K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240077

On 8/21/26 5:40 PM, Sreeshankar K wrote:
> Add RMPh power domains for SM7250 SoC.

nit: typo here and in the subject

Konrad
