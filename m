Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CFE3BED18
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162198; cv=none; b=TUPddtOjcWO5Ivhdb4Xk1u1nhFOk7ywZo8eZ9h+neLe+bHx7mpDbg4VeC/TloVZDBZL2/oVerBI/pEvTNSIzwUK39NfeX4OoFGiRUcA1I0Ufcb9Qu4rnLEn+/6gxxKG8kddyLQo2lQWo4YIsMzzp3eIoROodzCJJ6gMgsVTS8us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162198; c=relaxed/simple;
	bh=QMKWbxrTUoYOpkYxmeTHb0eNPHq3ygbKhMQAKrB5afE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tI4QRgku1Nluwjai07qUh7hhE1j/Bdt09EIIACUK6DedJIOYRjwBL4acs5+ch4PTLbYCRWqgFv7R7KLYXmjtRC7ZqUn8kkGfr+szckNEOuKQKqtrfuexTkwSXudYPP2MgiDqS7NBAM0lInMjF7kTfIPLU8XfBAUAZS6X3bsuAJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+KmXK5r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQkLDUzJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+KmXK5r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQkLDUzJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52ckH1445842
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VjfRna/iOcoNvFhmRzrlrbFVE92Mx+4K9kQUzzanJIA=; b=G+KmXK5r7+EhXV+j
	Lg9lsxxyMjIAtavWoEECAY6aOAxcHgbj5ovZi7OfMDZ1E7NS8PsEHbxNkC/nrLK2
	b66RIm2WzMlHtt2b8vm+QOXe+/8o6iHC1MRbRO4kbxK8ErrrOvEag2EAgZQxJHh6
	sOt1sjtwN/76ocamugD+0/PHPGjAH3AFhjm9teRlmp/kP5iw+ytL4Zg00f+E55Ih
	cPb2HFEct+Ds+CYJw8c4/1RFrR+iOZiqnr9bnzjBuCTP+7/Ze5/sviluk9G6noIr
	TVOtQRNjFjPx4T/NRPJqaW9QyRYlrOA0O7Y08tcS2NZWfUFfe6vdR9cQrJ01AKq7
	ZApx3g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgw2ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:43:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52b4e315000so13730071cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 00:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788162195; x=1788766995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjfRna/iOcoNvFhmRzrlrbFVE92Mx+4K9kQUzzanJIA=;
        b=RQkLDUzJ54Xru4/bO+XzQpIohyrLXa7FRmTcWvd8vmVFFD0vRsKOIQRDhrSsXDMDIy
         jJqOV1drwcefWEpUWYBnoj4QB3WqCd3R0lrxblQiiP2L1xssY53J/Lp5mXmeFm07uSvB
         VRPQ1S+matj3Qo3paTtuBhgws5n6wysuleNR+wp6P9nm+KOqXC6cJwH6ZYKqYjFKAmlS
         RrhEL++A7n+y/AEHlLxy+2QhtKOpBJfRUyejwkE+QsUQAHloJUrWNVUZ56nnStsIonKo
         P0dJVlXUBYdLd2mE8ldU+KVuNHoZN3ttNgdjMBZSnK3DXHtauz5EsQDE26Gaan0EfYGo
         PIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162195; x=1788766995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjfRna/iOcoNvFhmRzrlrbFVE92Mx+4K9kQUzzanJIA=;
        b=m1F3UoGF9K7Poz9Kh5toaTRyTA+tvwwwAkWmce/ro7xUOsfw1EwxTEY6VjvAwrScFO
         yLdKa6+Sz96MXbJr9aPuTx4Q69S6jo8ma/LksJCRWFXTNptqNPQ8YPIXvdhVyHuhXo9a
         uB2O5SKXQKHqoALYrtzCS6d/8GAq5lg2aL97V146RcVNCpP0up9F02RR6RfL3DN5Or1I
         Mbt51FOMX8W8YE3aneSc5n/hRE9Cpwwvsw03+qw9WXA8epYpLo1YuJcLSyj/HkGJQxPI
         YHYBGx+24y7VJjbE/xEE1+Wj3CShait8xrA59rYkdjzgPnroa2eHcyUdnOlP3n5dcWPx
         nWmg==
X-Gm-Message-State: AFuF++nVSp5jXgtDOG3gbdVWmL2BDFDb5X1dziNcJzDxlCqxr/+5Uj8L
	9qAG4dnKWMYH0KATk/ftv4YZzL2QXIb5VSgu3DLtAqL+kvlBF69w9bz9EAw1H8BciKIi4YC7S8Z
	4zfLm1FRiRWLPNm4hxBi5vA8klaKdZ6uIfQ41cNQPfPwaTsGi1ViaG8fI4itz5xo9iMle
X-Gm-Gg: AR+sD12DKLn4m0nCc+cSLfgYvY3SW41svndD+IVmLFHhOicVNCBxZQc+GSlu8rBe/Lk
	UWMa1CQsw677pua/V5W+buYz1N/bY56HE9A67D6v5o86LGCYXRaOADGiBjQRtAwL3oVxPCynci0
	nMahirlBeYgbqjavW0mNYXgBrWG7ep94lptpZigg0ip3KBYbpb0svJ+EfuOHiIEBIuSEpt8efYO
	hKtCpg6+F22pqx0fi1IN+KpBaKCBBXbOiiZtz2Tmm1fq3NYsn48GVzdo6XJZCTEndsP0wpdThQD
	OaRtv+CzD+xftriNy3wn/nfwLpGqquvg7xXFIbxVTCBHRaL7QQqkLaPlbaQXE2L8rl04HCFvOwf
	jdrh/pm+35Oiuk6JB33zD/w==
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189847291cf.0.1788162195491;
        Mon, 31 Aug 2026 00:43:15 -0700 (PDT)
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189847081cf.0.1788162195105;
        Mon, 31 Aug 2026 00:43:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611c69ca0sm3289262a12.29.2026.08.31.00.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:43:13 -0700 (PDT)
Message-ID: <35eec1c0-783a-46e9-afbe-fbd42376870c@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:43:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: hamoa: Drop unused #reset-cells
 from TCSR node
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
 <20260827-hamoa_tcsr_qref_0826-v4-3-663c9d30468d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-hamoa_tcsr_qref_0826-v4-3-663c9d30468d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2NSBTYWx0ZWRfX3ao8fwPF6O2M
 uYlEKTnnB/eSilMWkcTIbkUJJe+3NOKFKwn7fp4CL98SgprpjDAaB5npc5UJ1hNGFN5guDHE3D7
 74wHJQ9xK3oCEEsGaAEtBoSEtckpYWpmVZ3ctrDcX+/uUQhUw9/0TiJU1mGzEBRmRbxQXRxaRiY
 HMQz8vccTupu8F6smNZHqm8+xZaIhIfX3gHgKdzmzChANchWYDuEqQJ3JoXnULTjVzsBglg4X9H
 /1ndHYsTCMgFwMnch0xnURPIZ8hxghznFshGU0DqboijnVIGvWMxawUIX3RvNIW2yEcCVZk484L
 8x9TfaR/g1lEPu7Mk2YqDvu3IQSMz7NtbbbT3npzRgddth8zhub5yDlFKkvTOcIyWkP5g4bRt45
 VWlv7viELdwyMF2V357xec5FFoVjm5VyIHctueP+yDUqSWyx6rk0z9OlvCpfOvbtRoBooSHsHfv
 LT7SUE6LZ/9uKbLmugA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2NSBTYWx0ZWRfX/1ppek4NcPCf
 t5TU4dxxIS/xDd9JoZY27VT13oTJvP6NGnWI8Fol7ZxEhegmphVzCryP8sKb1nW3VnElTJozZZa
 HmdqVqdKeGf5QnJ+Lqs5fsOHd774yKM=
X-Proofpoint-ORIG-GUID: dRlgfgGEyc9iL4U6uGfUmh6mKoK9FEPW
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a953094 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=oAhxQwU1FG-qALgQiYoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: dRlgfgGEyc9iL4U6uGfUmh6mKoK9FEPW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310065

On 8/28/26 8:00 AM, Qiang Yu wrote:
> TCSR does not act as a reset provider on x1e80100: the driver never
> registered a reset controller for it, and no consumer references
> &tcsr as a reset. Drop the stale #reset-cells property to match the
> qcom,x1e80100-tcsr binding, which no longer declares it either.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
