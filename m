Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D03749D58F
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818574; cv=none; b=SiYDazpC3Bpt2HXx528JpddxfwkRsQ0jGmVt4ZCWSbNtCOiiWXgObRgQZTUcOPmBv9e3jyCyVXcrahaV1QFzgSDgcbHRI5O2r3Lmq26ohJKRUeueoTV2MV0JRekGY74h3FyyAlBbv4ItQR+s1PKRsYGjArPRCN966K2FjHF44+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818574; c=relaxed/simple;
	bh=xRoJhJ1AvQpHt61hi2ZYmyap1RubXShFWJ+UOKcfqj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7FoDN+9+MWuqr1jZ4l13e/BSSmwKg8yP6gQa2zO0C+JVJ+WL/caA2idVP7GcyO3nGEFVfmryNyZiW+sJmQO9cGlDtEcQs5kiu6jj/A/6CYRZ17EZRFoWoyF5JLPIxjSJyQHXEOhIWXFUOxKJ2iM5aaO3ttVi36MkijOArIEh8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cN5AVNxT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rm5Wo64U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cN5AVNxT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rm5Wo64U"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxsDn3363786
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5VagN2mi3Fe/oMevwo3rCpI6oJ8tUsL3jWLuRR0zfs=; b=cN5AVNxTwQKcA6s3
	ODYh3wrV48eb39bXu8iJPnOLRG3DoeqWvcSFgBi7KyGIzd97ld9bl/OZakKbDYKo
	dQSuEOgw2wQNquL7jFNv/xM+qFNzEkrsb+qwWrdScB+oDHgKPKx+X8lRl1YvjTdk
	sd+GgY/LJIKbJwINTqOpY2HcqeLxR5624TN89CLnIz6nYwAmwtAOw8Vf6PECHznK
	kbIXAlCNATGN+PYezZXMK8MRi06wkY+KwSxxjr2Xe8Mf6pQPqL9MIkXHdmmjcpSl
	80b3g/OzrWbDqC1nZTWs0WB5Bk+fZdgIulJ1nMpF/NAOnuD5PwFtJvChbVoEqLrs
	5Fhnww==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdr9dgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:22:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso17316885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818571; x=1792423371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5VagN2mi3Fe/oMevwo3rCpI6oJ8tUsL3jWLuRR0zfs=;
        b=Rm5Wo64UyT+I2Lmb++D2ZfzTNGrgB9THvi8942kAoO9f6GnFIwvHhQh2w61yMrQH64
         H6wExKmxuua7hLPWKr3v/LYMzZKk+XU8Lu0vNN9XwSM5NQmZavSNxoqjbNQ4BA9zkgHN
         Hxn4/eoLl8e6CZoTAKSGqMhLDdLbBj3qqT+sUxdnT+mZOLuJQ++fO1T25SiTvBOCErLl
         mOzLj7p7edGsNQZpiZ0Mk4dEr5hfQrPF8f54/NfVcvsgytOQkhwKCgH+2u6jBH8CF7/t
         VLf21YG6urWYSPmJqXbnbaqPem4l8zG3dOedSpN0trDYnCtyzx7oJj145jcuide9EcJq
         N5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818571; x=1792423371;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n5VagN2mi3Fe/oMevwo3rCpI6oJ8tUsL3jWLuRR0zfs=;
        b=lvsyVXs/Hucc/XW38EBTjxAJzKlLv4yEqiKByjUwbhPW6CmmzYalzux29bTZkmcev0
         rS8kXMKzcWoIXQR8Gobm2cmQ8HX9MJUSYaUnMnRMIkJsYKFWqqa9vr8U91Fhn5lfRhr8
         nBVby6i86xRruwIT8HPp2B3GusuveeXhvcd11JfomCakkS/2EP5vJr4VgjZAk+KadWst
         fC+s1Zbg2/Z9s7fh+XPARgOP9QKdSwSI252mS/Cb/mdDt9ojsw8OdORsqa/53bBbH4y2
         JiZQnQDSH7TRYG2TEVvKlovsKSPJFZVrHmWOR/5RAj0SGz3P6ezy6ivPDreTXrRfyyYX
         WkOA==
X-Forwarded-Encrypted: i=1; AKwUvByW5H4i2DHxh5OWIDp7JeUEv7VZcrVM4jQWfFf+k+NmnjBYgv7VfvISGQQCfUNTUfsdPA8H8uVid7Mhkn6b@vger.kernel.org
X-Gm-Message-State: AFq9FYKSIIH9b52HMafFbdg6vx+mZlmXQahDKstnRgixpC5upbJqaMh1
	xc2ernSqVy/lrH+BtzmriJlUSvHhcYBQxMf3EIzDO1mQSaZIH7j4DbFE049TYtXna19Im0oVWfT
	cRLg6HIL/AZYhiqa8t68LhbKxNS66Ag6QwucwV6E6m5NVvNr7Px/dGjJLoRNCwr4qdGXd
X-Gm-Gg: AYBFou3j8rUexRGnJj6/iOX3TSdgvS6F4O/XaJp+sJaDN7UxTUYBjKfQGScJKvhx5K+
	0IJ7X82rVA0UcROlf7nJWctdwJuSwmEAZKGfyAwiJpg6SkuWKxMKiWKa99oF2S5DpjDaL+nG3/Q
	d9jZbDIgTa6yBl2cucYDBpbzYOclPUGQVwVJXvo3wsW7r5cXP9PLdPBVBLKx3xJLk/cX/I23bjD
	MwYGJWauBi0Z+VSmiAAyKuXwicQAOPVSLMsiBJlffuV52ms9QnqOyeln+nerPJ6uQmyXaUm8WFN
	aNsHZOtwxLhXk2OODog9aocFxSsqcqKtQnwzaot8PGUEujm5lB6BeAu6zJdMl46A7hsd6BH9C0Z
	1ur491RSP4XzN2ne24lLjgQ==
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr1893174585a.4.1791818571089;
        Mon, 12 Oct 2026 08:22:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr1893167285a.4.1791818570443;
        Mon, 12 Oct 2026 08:22:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3597sm5300210a12.14.2026.10.12.08.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:22:49 -0700 (PDT)
Message-ID: <b156e0a3-f66d-4016-9d23-bf6c06e9c7f2@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:22:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/38] arm: dts: qcom: apq8026: Add space between
 OR-operator
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <4f490edf747de9157a86eb3b3db634e2b6f6cc39.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4f490edf747de9157a86eb3b3db634e2b6f6cc39.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXxOm7AiPG6A1X
 eBodirRY52CbbSqiDnUzBqVFRv6g176IKDtWTQZkpLN/C5+HipE0pfHkn3Tuy48tkIh9rCBEP1n
 PhtbKw7INBEnPUKCIwVy6rOEksUHja8B++X+p32wm1qw5hXJMBpXWSe+I1zagqYVnvwmhpT2m6d
 jf+okcik4FftZ3h0R/Hmb5G2HvnV3M7SJ+ltUYyFdhK4ErLuTAgWwR+Zrkuf9khW88uZcq/liwF
 KC6PLa4C6R5BACEPuv1hn9xGNjyKzYmvP6+JpGZ3nVUSy6RJ97HQ4xsdbiGTQANvC9EWAnkyqd5
 6frFV6EnmW7jhtE+e+ynzPmpgQsFGdURYvXU9d2QVBXGqOfEzTwW9UcYk0oUMeQP+PzMfKyEEbW
 6SsyhAvADngPS/v4E1X8QzAldinPyqFuSUHCtEA7zVXC/UaGDTaw9uc3IDlYqS9jnY8cp6R7eUT
 vB8YzLuFYH+Ally/hjg==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6accfb4c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Ae01CA2AY_RmMo-c5YcA:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX8d9r2stBsD5v
 j4sSk44DKNe/yfc8oSHoswKViAMpfp88BBYpmAvyAH5kklmVeSQPoUYIbiTmrYUt5/vsTy2WzqN
 L9vbI8D83BGdgFgXACzx1Ag6aydEdbw=
X-Proofpoint-ORIG-GUID: Zf5Oe9a1R8aqeu6oesCkmtr_Vkg2ktix
X-Proofpoint-GUID: Zf5Oe9a1R8aqeu6oesCkmtr_Vkg2ktix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a space between binary operators. Found/fixed with
> dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
