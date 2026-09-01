Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298724279F9
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 07:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247676; cv=none; b=kANhr2wFMNa/FEJB8YpjTl1nq67T+13a/P7vEByxeYqZ1d68RiE6/XlMcVKQvLy9SXLNt1TbLX8ijPucWnlPKzjmEmy6uHL4JIFFtj0gjBOFViVIF4xS/95ffcVgultdtZZQPhiFRFSC+Dz/ecyYdACZM0GyqQZiKQdEqZuy6Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247676; c=relaxed/simple;
	bh=QpBgJtjmdJnTRQtqN8guCqEudXz0WDJJcV9EznUgPfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASIB2GLEwOPkZGS4s22NqQBxFuvCrIS23IU10RKXR8iwpoDWXWvlMTQ+ZRWWpGfmMrO2GRXsx003+XD34NqwICFyq/fWPh7k1vdnyuM68fXxCYCbCLoyrcsUnCo+CscVH4Q3RgEhlD6DEZ0IlXzXY8y2BXyQKe3YGVfuJ24+Jsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YxrgOeaU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xw6EcatK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxrgOeaU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xw6EcatK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179JTm1975498
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 07:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vbrk9+myoMhVXlrzYgKXxK4M
	ogV++GzJ/+MxgxrYdK8=; b=YxrgOeaUUbqksygGU5sxEnX9VwrMrnbvbXs3nky5
	MdWq0UB0OdevDZXhN4y/50lM6E43kxQLXt0XfCdBmEq9cDvc5vAIw0+HDD+wf2UO
	fhe0j2wCjhrZMIINVUPTQG/8K26DjHteyvwtYgJfqXQimdyzMy6yWg61KHtIDksB
	LvCmUoW0qekH9j4Mh/hcRkqz7Nj0vhbikZUZUAj92TkUJCvMmDRKntMoSz3EAnMV
	Q4Z8Xoj72s6Zawf58KKyQOn06uoKytCPZIFv00FuL6+djf4oPVBXx6E7WUJwMTxY
	5DFazDDwG/MFViVzUBqCHcigH/z0ELxjFFGdddrZbp6nfw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r11e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:27:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9375d92d8cdso808619885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 00:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247673; x=1788852473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vbrk9+myoMhVXlrzYgKXxK4MogV++GzJ/+MxgxrYdK8=;
        b=Xw6EcatKIDhuKMBOeDBhGFz9JKIYRUIZmvYkpWmmvrCkU3Ovoi88w5xdh/8w7jwmil
         BZXWcxm6gHcEDQWUf37JU6nWXS1dWWLIMlM5Ol8FZ4arCDjLYfJBTtRGbuK/TxOaDPLw
         rbxyvSg5GgriaBm7Nhhs3QZX75p3S0FHrP9IPfLEm5IdPjNgG06CETtD+8+jmANpNqiR
         EphwJVlysFSV+OVbnX4rEouWehnjIKNIOk6U4zGkXGTTKhDuUCQ2j80DUt9xA/9VGeBw
         bRmfC7gGk2wOFk6n0MyLoTJfes9mvQfepGLLWmcb4r9V5Bzj4zjQmp1OoW9W9Ea22MJJ
         wXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247673; x=1788852473;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbrk9+myoMhVXlrzYgKXxK4MogV++GzJ/+MxgxrYdK8=;
        b=DzEneKtwc/q53Yph86DBbxaD6+kKHWClnjV7JoSZYLD9f5j1/cLQW089h7uuLT1r97
         MdujRzhkjMrVrr0MpE+3MI5oNFMKqY2+/hQl59JdJm0I+e6OrYAuNjlr7HjP0Ig6wI7+
         0NB26dbljprS0AjOopcsMqBKXLz0Zr2xFWkDRh2En+sEsa3On0M6FYoYrqsG3qXhp2qh
         KFGn1IE8rQkGl4BS7NaZxVlUUkRxtxkEhNBSKF+poQflOgxSSdKo6+/ivBgmmkdS/H82
         0mQwDSojZ3UFHJOefcrJvKvD/HkhUb48NRAujfJbhFhAwUlRIKP8Rp66WFpwHxFZkSxK
         WLWg==
X-Forwarded-Encrypted: i=1; AHgh+RoczPvb8hX52iOdB/HVuV29qDS8H2tMXdIlYx3mkBfLxnPYjRhIQsP21hmfJAnZZFcNvmcpTyLlzdb3B95g@vger.kernel.org
X-Gm-Message-State: AFuF++n15fPMUScIw3sJD696OcA1wCpEdC2aWYk8/j+qgyzKVGKsTQxW
	nVJLwb6+Y+tQpJTD3KG41Uzd+vt30r4mBD1MRARxxgA2SGO9fzwuiqpN28q0xkmKOFylPPf4wls
	sjJEWoLul0Cb5CZNVhc2MvUdkf0zDOPNuL9+vxNRvQSQ1Xcmb88fW4JvgnK+l28p16mfV
X-Gm-Gg: AR+sD11THOpXdM0fyrP4uzZBfYBD9eXzxsuoQyZCJaLhBpD0yKOPqgSBt7iEefgDrOU
	yL8P/T2OfVsJY7LJFQSdXdtal6MqVH7YXx1jFtxQWLWW1qDJDHXBXxbmNbD649WKERBhwaPW9aE
	omrp9EM2dXuTriXxv8SoZFOWRg4FDLnIICp46TxCljx7F9qdZg/+IBFZK6cjP96jCTmak1iyspf
	lHX1bCxiWqbfmHZhz0wow6yNyxK+1mBNmvJPNeMLTut4svgIzb+1U9e/WBVe3WsCFEho7cFYA+Y
	kfbk91WvscgtqoMvHKq5TZ5UvsqW21+QOLM3wx5rk4tJGxVOYYhPVq9r5KIwwZEeKZi2m16P6nt
	V/qxoBoRAv92WCw==
X-Received: by 2002:a05:620a:470b:b0:939:49f1:f975 with SMTP id af79cd13be357-93949f2048emr551220485a.43.1788247673274;
        Tue, 01 Sep 2026 00:27:53 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:939:49f1:f975 with SMTP id af79cd13be357-93949f2048emr551217185a.43.1788247672804;
        Tue, 01 Sep 2026 00:27:52 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d6e826sm2979946f8f.19.2026.09.01.00.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:27:51 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:27:49 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        krishna.chundru@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        sushrut.trivedi@oss.qualcomm.com, umang.chheda@oss.qualcomm.com,
        rosh@debian.org, jsandom@axon.com, daniel@riscstar.com,
        mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: qcs8550-rb5gen2: clean up PCI
 function nodes
Message-ID: <qsrs26dkgzj3shgi76a5emwn62gisf523y6mie4inxkm7elnwp@7tkru5vrxg7p>
References: <20260901013654.1343537-1-elder@riscstar.com>
 <20260901013654.1343537-7-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901013654.1343537-7-elder@riscstar.com>
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a967e79 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=ee_2aqc6AAAA:8 a=EUspDBNiAAAA:8 a=FWO2oc12U7grlVmzEtcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfXx+hCDQgvJRKa
 7WETukrgn4+avD7Za/r9jfrEHuQDGCGSmrucQzKW219yfIujppKxpl0/OksBqNm3bZilxh/b072
 miK0KrTijFOKbLCDbbcFPPOIqTKPdV6Mn6OtSu0jRMLtoNxW8IGamCMioX9bd7sU69hFfvXEzQI
 rCd2kgnHnYznNVxCdfHJjGHvlTR0vz5SliGroMhiapoNiPttu+ujGhleFEjz5OrP37OvZ+HCTyb
 miZ2ae8u0O0xoWvTwmAAvvyeliUL92ERkZDf9Jv4Olc3FF3KpvADqfVTYeZKRB1wWiGxLLfWX3/
 e3i5pUooKoclOidf3cxE33huzUMUU6oyoHbLfZpGne7xm28Rty4YneOhY2r2cNG7ly3jKA4Ahj8
 mj3Ifzz67OXBOWSgk2RXwPFR0t1TRhRhKwXkoz2kgqU3xqJeAwExs9EfoC+aYGNcTKIHZVm605x
 UvE3JoVJkUolKyENYEA==
X-Proofpoint-GUID: iBuxnJPqf2MGuhTAwNph1yloIiL3yfSq
X-Proofpoint-ORIG-GUID: iBuxnJPqf2MGuhTAwNph1yloIiL3yfSq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX1wn5Pw/WV/OA
 3PW87cBt9W8zNksCRvaJbuuwhqddFMoyxQZe9rC2QAfvhiCMIHxhISZFVWJwmBBbTFMKCTBl5Zm
 WgD2WMfNoULe2Es6BDK/2WZAXJoTCLU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010066

On 26-08-31 20:36:53, Alex Elder wrote:
> The Qualcomm RB5gen2 devicetree source file defines a node representing
> a TC956x chip which contains a PCIe switch and an embedded endpoint that
> implements two PCIe functions.
> 
> The devicetree nodes erroneously include a "pci" device_type property
> for the two PCIe functions.  That property should only be used for a
> PCI device "that implements a PCI bus".  Remove this property for the
> two function nodes.
> 
> In addition, these nodes define #address-cells, #size-cells, and ranges
> properties, which are not normally defined for PCIe endpoints.  Remove
> properties as well; they can be added back once they are actually
> needed/used.
> 
> Fixes: 33cae252054a6 ("arm64: dts: qcom: qcs8550: add QCS8550 RB5Gen2 board support")
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
