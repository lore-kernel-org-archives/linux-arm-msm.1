Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87062DCF57
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161087; cv=none; b=opLQzfb3QM/mVWO7BImc++PVpfNu9ZEW8kUWqtQy14PHVoEKY7WM6KP38CX8b7bGXACveboGleh6rzJvYVsukmDeLLo721JG9tXbFQlY14A9FW015C1Qjgq0M9ptnDL3/nQHOiAb5w/19IOyamVjtGjz+VeXI7E0q47Nf5rM+FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161087; c=relaxed/simple;
	bh=8TGC6zpIcTNPtMXhimEj7RyHbZDgyWcwozxpYcZ1MmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ltQOwDIF/e46QUTcq+qWqNBhg0DpLfALlFEREE1jKlulzStq1X535QFXd9XKDv0nsaI9H9wakrD5IRp4Qg2rr8TsNjb+mUxiS0+N0H/FlBCwDPfk0mRIbGzx7EkkF6wD/LK8DeHlc1GohaS5weD9ztzZh9FXMne54rk6yiUKQFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1xX4Fyl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdTT+nJL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1xX4Fyl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdTT+nJL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDle5A033165
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CeUPngKv48iUX9hf1+kvn5eH
	JFECQubuuQ9wD170ztw=; b=N1xX4FylSSyWqscyDSQJqtFfoViqB4G9GYbHfYZA
	JgSE1TWQWqWWW5bzM7esPqUHRCsapWqxATO8yW46OoUzlX49MUl6oGVCtbjDT0T5
	dNXBRpIeEyGP2yaRrXkpKVgyT0pN//voZ3rS1IXteh67ovjWSEwnzHgyRcWirS3/
	YSw1XWoHCkUN6/SIRG4w9V7+tE5pHvn4Sa16dgMH2SUWakEeu8rZYy9EYVi4Q9qa
	E3KJz0JKZaWkunckG07QLh3fNa4MIVrA6Oj+TsofwnnCsIbzl2VFmtdQpy7Y89ns
	ZAXZDdchuU7EoaQoISJpmJwf786lsw5OZ2GIazTaX/By+g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c614eb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:04:45 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5a787be4ee9so3631616e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161084; x=1785765884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CeUPngKv48iUX9hf1+kvn5eHJFECQubuuQ9wD170ztw=;
        b=jdTT+nJLehD4ebH2TAUUXYnli/uqI1A2tDXaZ8vOzoxYxk0aTq6AiJ5pBCSCv06lCp
         qy3vj1yOIZ9vO4tAFl/V6aqO7AshSD7mYwJNEcPn9qOHPUwL3n7lVCbDoZdWpGXzXkQ4
         RmKZ5y2Gjs5mZUYYhMA4h6NXickbHDBHXkb82VSsMXOC3Aw41qNz+f5Ajjc68iNQX6Jr
         y3zAV45XPKEkJqhOatulCKeZ+lh21PJf0emONewnaRq2b3N50awTRETqpgRXeVSgiDzt
         C0oYnahBgS8jzGzU+0Cb5Tn6T4z5pKLua63jJB3zUH2KrdloVU8Dh+iYiMjwS0Sp6ii2
         oVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161084; x=1785765884;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeUPngKv48iUX9hf1+kvn5eHJFECQubuuQ9wD170ztw=;
        b=tZwFSRjR/qyWVjSPP2vDKoF+mKMHVstiFdHrMDnSj6bucTjQ9rncw4H+sewWrNNZWu
         y5uif02XsxKRcNYPhPWNF5lCjlOEF2QQhOVIEHcyXDIEJKdb9KeCbxSejukRtgPJRT97
         RDzZOiSob28IMbAv4yCdy1ypnZ2fgIr2lMvtfGmkpxqr6Skp8vs1oOiRsLF07f7Bh4Cg
         GzWZf8BL599cDLW/xH4hfk+KUzGOH/fRRCLPKhzcrL/d20hY9rcUfI7oWDtZYWcVRV3+
         q/qm20Dr0TILm399d1i7CqaLlXonv068jLleHR1PwOj7MwirHKDZ5PicStsK2Bx8nhKt
         qOKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0/jXEacSBI3p6sLazf+5qZar2nr2fP7wy91EMhUyFBhbGQ2Ci80vIzg1+i/D2dQ//o7K/c5JTvgTEsm7O@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6G3AZyHm8iQJwRsqaq0uyzTp3STdl/WyOY6q99AcRogJ0k8xL
	6Y/Hbm162iZyb4ybQpCdbjT9g0i7d8DSjII+ObZdNUrF3d6MlZJYCmkcTF+0Uq848CrZqkTyvdK
	H3US7pF/riHCZE4znHrrT8/1TZmg5VoEODHQEyIitmICHjpNTcNXxeuwSLNk7RezuFWzO
X-Gm-Gg: AR+sD11cUTzqXEmKaf6LlRAbRhjr3gFS5hLXn1fNEPW6g5Uow4q7FwjUF0tuouyh4Ov
	YrIsfo137P/7zLctC0/h5y8ySCm5wGbnkrl/Gsdsoi5goS1TZyezr3seMCIK6xsvc59aUNRBSvH
	/RybA0YRWOhcekgYz/ng0VPxZo07W14u0JPC6uCG/fLbqkex3z6Jn9mMNLDPBjv/mQNyRwyV/Ur
	X4Y3ZTo3jKZnM6h1rdy5MZNkzwnmekNI6U2IGe6pn/q8miv4l9JofcgNNyiyUsaQ9GsbtBJ1qeX
	oB3PQNgTYiWEGe3Sn1LeZ4wIQbqB6AdAGV3BNiKEX/1EImnanSjai3lPb5i5TXEtIhljKGRNTVU
	kWsYd0BIKQfsqoUU=
X-Received: by 2002:a05:6122:289a:b0:5c1:31ed:157 with SMTP id 71dfb90a1353d-5c306d68eb1mr3846414e0c.13.1785161083868;
        Mon, 27 Jul 2026 07:04:43 -0700 (PDT)
X-Received: by 2002:a05:6122:289a:b0:5c1:31ed:157 with SMTP id 71dfb90a1353d-5c306d68eb1mr3846364e0c.13.1785161083335;
        Mon, 27 Jul 2026 07:04:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ed5f93sm360241405e9.1.2026.07.27.07.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:04:42 -0700 (PDT)
Date: Mon, 27 Jul 2026 17:04:40 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: kaanapali-mtp: Add s5kjn5 image
 sensor on CSIPHY2
Message-ID: <eedzydcytcmppqbninukwxdfnxnndmpjmmgqe35vc3c4aq3ntd@lxnu5upcye7o>
References: <20260720-knp-camera-v2-0-a21c3f0ecd55@oss.qualcomm.com>
 <20260720-knp-camera-v2-4-a21c3f0ecd55@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-knp-camera-v2-4-a21c3f0ecd55@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a67657d cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VaL2IKI0iZHC7nxK__QA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNCBTYWx0ZWRfXyew8nMwBoTtM
 93Wl6joQL9H9wnglQIb8rJr56j4vWwRhj1WONuS4wfO1zIdkDSNucrSMNby/EpyI+LDrKcA0hlC
 uC1VI4UFW2SNne3V3TAtv1I+4gXG+aA=
X-Proofpoint-ORIG-GUID: VdnnLvYag6UZz99V8fAn1ojjX1mp52V_
X-Proofpoint-GUID: VdnnLvYag6UZz99V8fAn1ojjX1mp52V_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNCBTYWx0ZWRfX9Ka7xBLC0LwC
 Iy27WEwR2ktA9LuiudhUdaly/UNvRDyDu7gYnf9tWKNQW5chIX/Ovq7m8B4tDmJQvDl5QwJOcES
 WynJKyVQAHotDomInwvG0qmWExRbQacHaJnI2ZpRW9ZvTjWj7gvzE6ZrV8/3zuv4lxHDwwuZq4H
 eHE5JQr12jk+MdtZqBApMNchfU2WRJIDL1M6j6NEjhUO0Qz1w3qpFhe2BbxB+CGJs5RLe7owbty
 9VodgbZbEsnXevzCzZlwDJMgeURJRxaaD91LltsbiOAdAZaXUbj5YUh0RyLZg4kFrsOyAKNReA3
 lzvQ83DwM9BmwdWCqaESUF2vbg80F4WFqHCgWgOsxRwoQ/h7Wa9OqgAbURLeHSh7JsSKRkgwHQm
 DNWTjIhlScQ0Lbw0g64Q/sTbj6xwqKwuhpwXDDdIhMKSN2kKmXe16VV1zE56kYZ9XmP8iuGAID5
 GbiqyK0i+JSs7CsDVFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270134

On 26-07-20 21:57:37, Hangxiang Ma wrote:
> Enable the S5KJN5 image sensor which connected to cci0_i2c1 on Kaanapali
> MTP. The sensor appears on CCI pins connected to the CSIPHY2 interface
> in four lane mode.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

With the comment from Konrad addressed, looks good to me:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
