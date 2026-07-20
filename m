Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3793642B32E
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784557971; cv=none; b=JtUODAMvkVbH8wtLIdfTg1ZhcMZSFODveeK60egwXDJA5MpKXG3pPILqpGymQBKgN5m/AaM8LoIs2yo0/Pb47TPDOrzfzf1L8HvpV35A10PvMkBYOtrgTpVBtBReVALNoi+A3EZWjkJ2wAMmbUKRuCt8oGQ3nqX3R4JlWjjWWm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784557971; c=relaxed/simple;
	bh=AEkLuVUgylK4EoEwD2hvLD6ts16mEmTvm6PZ9F+td4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2eRxtQb4Wq5I6Cli+nX9452Id0RuznB/4RdawRDv8GxCaDYVquVhYQ7An3GQ9/bFP2WbzSSQ/TyzJ4CkUnW4tS0gauf4Cd3APwdcxIMdQCkaW5vdNqepsty44PHbVgprS9PH9HIC9XPhJMDrwjmLx/WsJptfLV6LMwaAjdil30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAY8ZIL1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2BVEaHR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAY8ZIL1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2BVEaHR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqNXN2836901
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S/WeUwckf3f74++XzEuBaWCC
	S+n1/Q2q4HL0u6qGCK8=; b=dAY8ZIL1DS16sKOB3WH0LBWUmBt3Y01Vu3QkxqmT
	IowEm636RTHKU0F20j1ZQVwR7EouzKnpYDcoVg3PWPvCrkoAuS8BbjMLSOWLjr6b
	bBoT1QqKtk08f//KoLOp711LnBIQAMWS7PQE1fGl8PDgB3P6B4XHzSe3+3R63L0g
	tvAzcV3PCeiZCYR7Ss8M8Yc8dfcBj7wVGobasvDdCNtLNRSBiMqNMuNZ8Qa4gq+g
	qA/LdqeytLkcc7u29GEhKf35M5Lve7VuOZJaALF9EgoQ0D46waYFa7jCM5y+IOfr
	6uFVRvK+oGXIFwtguKoEQ4V7/fTHSR/QvzG+vYH4tv42RQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxhp57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:32:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c2af04aeeso7185901cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 07:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784557968; x=1785162768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S/WeUwckf3f74++XzEuBaWCCS+n1/Q2q4HL0u6qGCK8=;
        b=a2BVEaHRlLI679Jy76t/TGW/nPG2zVWl/Wb6FgwgJWcM/32GGf2E7TCFYVHQPWA2ye
         ZeTQItsoLLiUrDnVyN02YReRexPy/mkJP3jJPKvKT+t3ssP1Q14A0OLZ6egDUz+vwSiy
         ZgdwGdCpVlrLuMz3YS0t0cosJEwtihjLBJvauHLXj58DlLSzP+wH1a88ofvgMttRLRDo
         SNx+x24X5rg7VIh5gKHCZb8fOJUxuUTzUTlEg6ZmSdTPCTwibTHz7Q8ch3U5lwE+fMHd
         L3zEKep70+M4jWp9RjGiWyzZlkUpEw/6zjDD6DH9K8hQ9LPmd5AaAq7RV+5h21rcxx6n
         KNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557968; x=1785162768;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/WeUwckf3f74++XzEuBaWCCS+n1/Q2q4HL0u6qGCK8=;
        b=AyEQpynV4lSvR6J3uSGx4zS3MjnlXp4c6YNPQteCXOu7v9H8485ZPugx4pKXe4R0hl
         Ng+vVSRFkk3QfZCae22uh9oEUw1GilV8DjwO89tZWeYpBK4zKm870cGdrMQHncRQCNp6
         SlCW5GV71p1RDW+EZfq51lNOTKuhsaRp5Neb91kp+1Cwi8enskW0qKok6Lmcf5zh1fFn
         kGVYyr/pEylhE2MUaxdSuWsW0Z4Y5mK16PXa3nRxFXu4md36iCbCeo6a5zz5QcxqbEUT
         HchRlIwMGzpbXJpAh9+o0Qdph6TAYCj4Cmohj3dgy9QuOduRZK0+0Mo0/r95mwGdM0RA
         RwUw==
X-Forwarded-Encrypted: i=1; AHgh+RqCjEgw2J7c4SqceQwLJvXWX5L/V8A7xmBNpKL3T0huOhq5wYPHRaqpWKHZmYeI9bpDssc7RlvkGVVKk6Su@vger.kernel.org
X-Gm-Message-State: AOJu0YwSzfsKqA2AQrEnavQM1/kZUgnjS9PtXh67Q+gFDv1FJlm/QLzr
	rSjuGjtp8VMpPCL4Tbl7xiuNnUjws2OmgNBVOH3YTySdFRUBiC9niJTWGujYU3WKDvf8lT3J3Yd
	iMwQhpTEFyoZuMIxwZpu0YYuyvlvujpyDeU9lNbwPHRBXu9+dt+RFycHdT5JAGi+fPzP6
X-Gm-Gg: AfdE7cnhjLW5MTT/TdWRyxsDdPf6dHsjSrFXUIIimooKV9p21gbvJ8PP4etcUz6XaWa
	clFv+Or1ykSTvsVQT6z/BLoD1gK7Uzd7yH28gcZXI89hG44ey9KePW9xd/D32avZMd1krAvVh2v
	HT96/5QYCcqplH8DvEFjdmCsHpKze+dNMghkYcpehGLxdPzrf9d8/yiHvd6NQ8aJGofjH5MjYlZ
	hY/AuUERVwmOFkH86bhrxVKCn1bFK/ao4qYI922t6z5AYLsRYH9e6CsbiJe6Ldkig4mSw2U5jdr
	JhiFqSKZd2nWx8XDUAy+tIioL+OOqVSkomGuQhJ86KXlUgplUMVXdIZ4gRH84ozmhZmy7tmpk2l
	gVEEB/meokBDD8hsI69cROzkFMJDiFlTgLTTaJuTy8cJD2jI/bKaVgzk9uWdoRNvxgoTzXkiSU1
	+UfRR3KCzTEcw7bQ==
X-Received: by 2002:a05:622a:4cc5:b0:51c:8556:55f0 with SMTP id d75a77b69052e-51fc1a7372dmr181896881cf.34.1784557968188;
        Mon, 20 Jul 2026 07:32:48 -0700 (PDT)
X-Received: by 2002:a05:622a:4cc5:b0:51c:8556:55f0 with SMTP id d75a77b69052e-51fc1a7372dmr181896371cf.34.1784557967551;
        Mon, 20 Jul 2026 07:32:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291d8a3cesm2425978e87.8.2026.07.20.07.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:32:46 -0700 (PDT)
Date: Mon, 20 Jul 2026 17:32:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/7] soc: qcom: Remove redundant dev_err()
Message-ID: <xy5l26u3noesz5tlq6x2rmoxcnjkywbyu2pp4wf772bd3gc4kq@4zsefrrzxydw>
References: <20260720095920.542801-1-panchuang@vivo.com>
 <20260720095920.542801-5-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720095920.542801-5-panchuang@vivo.com>
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5e3191 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=1WtWmnkvAAAA:8
 a=EUspDBNiAAAA:8 a=1R4QrPrvjqaQTWIxgwoA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2MiBTYWx0ZWRfX6O7/D7C4k+MD
 teHMLQ8aKochNeTwG6szlgWd5IYl+qZ60Kp5VI01LYE+k01WXpygt7LYmu9/1zGwpyD+yhEdi/P
 kDs8580GJGI8PJ0SvW/WXwdCiY06y0M=
X-Proofpoint-GUID: 7QJcVUZRw2XF-lk8hGclFG3DlEKYtv34
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2MiBTYWx0ZWRfX37i7Se5j6rEs
 c/OAxFcen6eJxBjZ6cxDe+84ILIaf0MowxNacsyqKbpPHCKz48Rtq9p5ySpYHjRACx+QlNYK/aC
 IEfW2AmJzjMRLl5hWwr+4p6Cj4q9naOrmWo/XICs/4zuTWA/Xexh9j3Hdlquk1RmqqDQ7SKecXZ
 2GDMJq43iaOvykfhAh/gBegHX5FVn77fDgDm/zr70eTh4eDYm14K5b6cEFetEJ4Fv8fKBCYSLzi
 RABrBLaB+CkomlvkeOHn17rOSz3jeTWo2tI7FqmzKGjRmPDLqy/Pf8R1hNcoSj7nEDgcyQSX7lQ
 XP5DoIc6x+BaEFUYQyr8naCQiK5z1e0ulXprq0g7lJH9KA2NFAzk1ektHCQDccPtPNtzKCUvvor
 JawY/8YWBvAsdierUml/ko4ltZoNEwJlArq5qa1EpyxThEgt3zRyTnFoj/QJnDPl+2XVrgMDppM
 WEnhqoh+KRhql0Xo/2Q==
X-Proofpoint-ORIG-GUID: 7QJcVUZRw2XF-lk8hGclFG3DlEKYtv34
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200162

On Mon, Jul 20, 2026 at 05:59:10PM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"),
> devm_request_irq() and devm_request_threaded_irq() automatically log
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>  drivers/soc/qcom/qcom_aoss.c | 4 +---
>  drivers/soc/qcom/smp2p.c     | 4 +---
>  drivers/soc/qcom/smsm.c      | 4 +---
>  3 files changed, 3 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
