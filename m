Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690DE47DD48
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466152; cv=none; b=dqOvWNSeDzQsqxC8lZX+30/50SVErc8iMtp1jrxY/tQPt1kuZCByry345ah9+lzObWW8XCQES+JiCaKAl72xjS2DFDigek6yDRVw3qHZqEJkPxYaw9AeB6vSdb5YzPdQzeFd9vJyAD3Ma6pwdFoThVsccqgAXLGZK0jIOa/urmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466152; c=relaxed/simple;
	bh=gDXbyir9zNLTnY8M+vk+mIoyuEwmxWrzN2KOnQMYvVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBLuKbJ1z21WaXUG69U7VfVhPj6A3tve18CWzCfrgtrFo4p+2mrZx+tl647T4AOkDFVFv/8o6QGwday+XEGtZes8/q3ngaANkJp7y9yXXatnYuEEtpXOmuxdy+qjnM+iV6UDU+PDQV6YNZy3zA5O5fXdgfJFp4QgxfBc1mA6Zbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRb14ZnS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RXAtF1Fu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRb14ZnS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RXAtF1Fu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h3qX3415738
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6m9X+B65XWswH5gO8xBSHz9W
	RGzYzaS4EqboxMS1g1U=; b=dRb14ZnSW3i4AuozJwtoX1s6PEnBOzpu0B27xsmh
	6kJ3HkSHxAVqQXfBMpF3hFSEej8N+7dI+NYd+E9e4s5mITAD7kaWgn8Y/W06dOn9
	3Kid0SfgNYo+Xi2OwaYs/cXDE5ywiYGdTCKB9kI6bjypH5G5RHjyHHj1PT+Qf/dE
	DW9tKV7CRmgkSVhXdtFoeW0SzbEGoJiL3DWF9BXsPBuENuMFit0i0158YCM+xfSx
	Q4rDWtrS/ZgkESgruYQasnhmAwMlJG3+kbkN2pnsrq3UnGwNFe/aXf5Q+/KVfwQz
	zNufGKn2DOsfOvD9O+m+PvGKygjlOWFroheqPp3C4/2TNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc039q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:55:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934956beec8so796476885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 02:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466147; x=1790070947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6m9X+B65XWswH5gO8xBSHz9WRGzYzaS4EqboxMS1g1U=;
        b=RXAtF1FuSRYEHJ7TMK82jyn542+L+XCPhzCIgUI472Qk830HCJQQ/kFwP52gdIXLnS
         srq8UK+40DdMy+fU5MKU6I5IbJlpNKgeD4JzG6MLXWbx/iF/Y/GazydsJ8UKIIKcfKdL
         uGlJDMmAAlDh1MAy/WOP5PrlRbUI6eqEHnqnIiDsOdvy5IG25GPlnMjTrrqVaQjtfKqL
         K5MVa+lbWyGjua4rtBBudWE1DpG349MBnZp345fpajxhDDnAYxxG+2MXgh5lR7Z8ZT2M
         h+T0vMtoKHNnmfIimNqDhkJZ+EMj9VIVFGWDoKsrfV8YxZBFQDUwwYptsjyHCnfJfJN6
         ++oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466147; x=1790070947;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6m9X+B65XWswH5gO8xBSHz9WRGzYzaS4EqboxMS1g1U=;
        b=nsjpw4WDmYtL1nn5N/O+XzVp1i8O41SMuW5woIdRjpQdQGxSAzuelCscdNpMvBgyH/
         bc9rSDmFDkq+o3wizjXTPHBi/ciP9v4JYVcQkV0aTZd8U/FtVzyuU3SXQc5ShxP/T3qi
         BKGkhftDHfxk2U1ahxn+H/NwuMLVTRTGxsQT/XxRY4rMsFW+gQzhL+F62m6dmGLB4WGM
         kRWIQRBjycWEK7/FSEzFLy6nfTqWTW1SvrBJ+N0ab+njLeVmqERUOo3JUpkzrub7RxtM
         IwcSQNYGmNqeF/TvN4DNRYubphvaJwUFyhbK5JycwZaI4AbM/4yUL5mnOqEEKlV0I0So
         +7gQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLGokiBrBsKmQV0PVx6toEPJo7lHm3ulJHySZ5ZhHQB4KHyiVwhKdJIvCKbZBj8rXkaMSr0JYxOFqRruni@vger.kernel.org
X-Gm-Message-State: AFuF++l9Jo7JZ31Vs32YFI4UmtBkSFcXYb357uGiFp/bVi/Xjpq98nbH
	gqpEfTmOoMYUhU6UoNZ7nCQ4xkaS4fSzu8uVtXuXPPiy13L8PqqbCxGFR2/crYjp3qeJVvqzS3f
	ZBcFleR/vss4jju/Zneh7DrEkSIpMPe2jdfeH/TWm7XLYM/apiw9b3nrfGWBRoF/CCzOP
X-Gm-Gg: AYBFou2qh0l+MM18qPPT3nkeKkT9SBoAfCwGGMAZnFoHSQORJk8o3sat1JGOcGO0cPV
	hOEnZeEnXZUJIHxH27uitLgR2tIkWuFNzgn4IpQCIkqn9V2NeG1DcRgliV8mK2VYslHKmRyVm0v
	ftH3pchS54Webyqm5ApjwDbQqoU3KpYM7SuPwrQe7TRzzyWNJnC+oe/x8hDm5ny/zyt8Cc+jzlU
	7Icv2VagL0yOpvjEnqm1QBpBCst62J3KOSddB/VO4oYsDUtEtU3zUBILRTb/fB2Tu+Jx6OADTMp
	i2/X0bBS2/CgLZMOb9jazHAx60wsbvp4jTidOcMGB41IvmgKGQvVM3nQbLY8r4N53QWJHYcoRKl
	hUdXdj/bk7O7HR14=
X-Received: by 2002:a05:620a:6602:b0:939:74ab:c1b7 with SMTP id af79cd13be357-93a407b811bmr5426985a.23.1789466147014;
        Tue, 15 Sep 2026 02:55:47 -0700 (PDT)
X-Received: by 2002:a05:620a:6602:b0:939:74ab:c1b7 with SMTP id af79cd13be357-93a407b811bmr5422985a.23.1789466146454;
        Tue, 15 Sep 2026 02:55:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27c88fsm53038125e9.2.2026.09.15.02.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:55:45 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:55:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, guodong.xu@oss.qualcomm.com
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to
 PS8830 retimer
Message-ID: <qwulccp6m22csfxfpivgkzw4qla4cilpwmkcxbszayzxuhdugt@dkw2ytmn6skk>
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
 <20260914101233.981643-4-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914101233.981643-4-xin.liu@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YdYN9_JpBR2_CoO7vNpSCP7xwpIWRycf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfX7WIo5nlIVxHc
 QxFBmco0PWeB3Ll8ubGJ8Smf8ob/AP5ub1jlyGfsrGyImr/UM5LllThH4PoNG/yE0plat0hA7gN
 7+g6m7KJO/H54B1Sq9hitdrFoRVY6a8=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa91624 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0xWNcfA51jHuHAl5ng4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfX2vBM1QDaW/QJ
 0aLLm6CjNneemf5R8C/ndjO1TOendjqxPCCBu+G2TiOIKnHrIvSYLTJRqgzU5Ttzoin83A7z96O
 XhjfrgagVoNBv8xZfZ/ckn/144o5lcMkg3FbsEZYz5K2LA0As2hI/LdUAwzYqkDsCQicHLA5lAq
 zxlK0aTGPbH8HqLJ0z9h6j9re6JBsEuMR+tfsWZsRbKr5BVULqzgg2B94FoJUkK1G/33I4DbgjB
 IoatlFpp/Eor6AB2x4YdnZUIU9ZDJDklYCYGOKNUcer483C0VVSMTIAViMnJWf+kzO2HRttRh3d
 FEZYVa65Qs9+wgi/ve9Gph4MQfhBNvAOKmiKfKhVCX4xWOY+LV1fyuz86FJ+QCfs1M8GelVhmMW
 YfaO0dl35fuJVMQw0j+b5Ux+3rnegH2gkVpxS/wwzj5Fjc1iHuiAkUAVy93jQlVrkOXac/1oiTW
 d4UkXrnrSoxUz+SFkPA==
X-Proofpoint-GUID: YdYN9_JpBR2_CoO7vNpSCP7xwpIWRycf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150142

On 26-09-14 03:12:30, Xin Liu wrote:
> The Hamoa IoT EVK hardware design uses a Parade PS8830 retimer on
> I2C3 for USB Type-C port 0. Describe the retimer and route typec0
> through it to enable USB 3.0 SuperSpeed and DisplayPort Alt Mode.
> 
> Supply the PS8830 from the existing vreg_rtmr0_* rails and remove
> their stale "Left unused" annotation.
> 
> The FSUSB42 SBU mux chip is present on the PCB but with all signal
> lines unconnected (NC), so remove the fsusb42 node and its pinctrl
> group. The chip is retained as a hardware fallback: should the PS8830's
> SBU path encounter issues, the FSUSB42 can be activated with a simple
> rework, avoiding a full board respin.
> 
> Co-developed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
