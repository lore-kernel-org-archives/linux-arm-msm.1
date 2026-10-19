Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792449339;
	b=4Q9coVvG5HGGxpdJWmqHISwvVXOXsw2Zjx/+nLyHpH6cN+ODGBuigK0PdX4SnCo8lUrk
	 Tdt/rYWQiGxE/DS54QjMdbeHy5gUVfx+ugdYvo6RSjvgUZTAp4b3jwlsnVB27Ybc/33ao
	 UKNNVcpe3HNaMYxaN+ADDHQ7wpNOb6LH+13mlhR5A9agmCYG3IUnIxXvFE80xHXxbgPv5
	 3cNPbmfsBOexzkWkaT37eIY1ZjTNjyfstTaKjebpwxJ2mZAxp0YcAnDjaYbcUjkVQqhAc
	 4LORTWhY+I3PSkzZI769hDQmOeaGCY+BA9dYQKkxKJrPISgQgYr1b/ddY2+DzzOH4qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792449339;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Pt9nzRxPIl7P35cHqXHVdzmbGI/WZ35dWXVb2+9inZg=;
	b=pSHxsqb5tQ78ACkqHaV+AgV68HlYk997lvRmgi5IEEFQAyey7RZt1CtxKzvnIXHg8dOl
	 FrFZWGWsHT/JNnTBg1Rs5hz8CqsbgHqQ78bhv9zo3x9RsE6sB5YiX+LHQ14hfTHPkd+0a
	 hmuGsZ80qBARW/X18I5wwffBjuR9Zp5/nwNGxQj3LdOwXuqYBWxa+IWTQLpDnSJTu8CKm
	 bu3qDMna2UCeeaOTZkaMGFTCuMwLeC1172iJ3yYwbIsHYkpif0KGUZ7beKcJAh08gbUpr
	 W9q6BuHLMoVdURTNY3y7j8PznNz1a6TOaSns7voHvxq9Ek8WBfAUWC4zicUVu5ywQvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YKCoiIDF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jdNUPsM2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C923606A319
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 22:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C923606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YKCoiIDF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jdNUPsM2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JLZdSi2457932
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 22:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pt9nzRxPIl7P35cHqXHVdzmbGI/WZ35dWXVb2+9inZg=; b=YKCoiIDFqykGqAD6
	2GXQShRnEXS1WB5jRGVqj0fkjbTtvbKoA6gq8EMv05sKwSnWk6RLqQ23CDD1GqOq
	/rS0Rkbkpvpu3ZMkOVDqOc260HZYaV9CnLCIUzMckBu5pxx30B5QkYsgdIgDIjau
	mODtD8TtjqNl+cpVDb51HhFiIziII5pTnwVESuQPUz1Hn37ssWSGLWp1MS4K4gTS
	scDwmnv7nI11Bqxgoh1vthOZ7YObh+uZmyWb5dAqpop9Ei+qesz4fhyuun1t5TAa
	sMGpdwX5+02tpIrM0eoPJf6YjPbXFOMlr80kI1TeRq+Aa9SnU0TyX4U3hFUNy7D3
	L1FP3A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65khjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 22:35:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso4390796eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 15:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792449338; x=1793054138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pt9nzRxPIl7P35cHqXHVdzmbGI/WZ35dWXVb2+9inZg=;
        b=jdNUPsM2dp/a2ALnBGjQwJ70USU3zOzLqIw3zQ+tGfobIHEv/7TT+sKW/y2KuCOXFt
         Rp++lD5/vde8uL6jjqzexemf7vzEgLpt6r6hOse6ecsjfT63pDFj2R6ydLzg8zmdNTLk
         HjiKhScurdWRFNg0dhf5vvknDYo9GlftZmvlgURuljWnjNQRax3fa9SilDUEg1M3paGa
         Clse6MkgjOrGRXwm+jUMiXfELCxoVJdcLkEzeX76GwCbvD/j5z+ydWdiLDurdVpXmMqG
         q/ewQU9Tm4yO5yQvXpdYY0z3Yf5DVFjL4GKLqPs1+hpSMcp8arvOc6eHkNP1P0XVTnuO
         lUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792449338; x=1793054138;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pt9nzRxPIl7P35cHqXHVdzmbGI/WZ35dWXVb2+9inZg=;
        b=krlkPE4jFSpMJPmvLeuFjQ5y2YVN/4uMxwKP1d5oNRNroRjwP84LGVoFFDfL8lZput
         SuAVSqsOUALkSsT+xGattfvdDSoC2i0Yt8Dc2drAek0YBtfQ1EenM2mUfa80HmQHYBMX
         W47TugeCjv0Sfjrg5vaffuAr6K+TU7hvOvEOGIbBpvDahZMcAgOoQaP7B+J/eOsuIJ3v
         7pdxuXuc5DozfnE4Jm5w3QYCO77hn+Ds/hDayyTtYeHag1s9eRxvUe0uhtI9hz/1/aEA
         OyZbuO3kq4cVuMElZl2HuoknSY3KW/3YkCnAM8PdToiof2iFtbjfqUGPliLTfFOgs3ij
         dGng==
X-Forwarded-Encrypted: i=1; AKwUvByqEFFFZCjn3KEzZdgyzs2QOd/8/TRjGQs/TUjFQxtSf+B9MeUc5ncooXOyKiM568wRjS157H9MjRxXLEx9@vger.kernel.org
X-Gm-Message-State: AFq9FYKnIs6p/sdlCcSsfVC6qzSYkqmv8hW1OCUZ1+Q7Vwsop3UadtwQ
	yZD8p83+UtDtGKaOwpXmJ2jxOXJfZqjGl5fNJOctAzPErsouLswF0L/oxeDkxQTdsPVwTVi4DCH
	LECXze8u33jtOEH1esD5Uq0aVDSQRzis0jxgUrOeGyfA8pY20FwvLwoO3C7n5tu9aOa3o
X-Gm-Gg: AYBFou3peG28n35qiI1x0nXLNMtP6tHAsjVqA9Wag0GeGHdKFtOi+cxY+xxzY1Xh7dK
	qVH/Ro8/RPdQcdVOFmlGIlXcCPbzpY3ZCgTOV2+MP9gStOPo4bYIcgbmGuhIWr+XSol8qJ4u56n
	2TkWUCJ01ZZ+xwGW5EF1Vewnscf8wdbl2ZDS1JtR/keK0AHoYE5vkYiwQhmgr4p8Gx6xCd0D3Mp
	48ZV2tbAIPufIVM5+qXfurxEdxNeNXS9vgCdoTyCzsTfFyMtzq6bDWwwRZIifQIfoHKXh1zBIRN
	59BRwB9703ENV+MsG0KzcdIORgUelDpIpTjmAvqBvZ4Y2n56jDTWZhsg7ME9OCkgQZ2CPGTkQeZ
	QcxS0qiDeAhET/2S8s47k2Js5yOcHQRSvuL5iKc/FPWLNrP7bp0oDwJNg
X-Received: by 2002:a05:7301:7305:b0:34e:9923:e372 with SMTP id 5a478bee46e88-361a2b35aefmr12367177eec.29.1792449337784;
        Mon, 19 Oct 2026 15:35:37 -0700 (PDT)
X-Received: by 2002:a05:7301:7305:b0:34e:9923:e372 with SMTP id 5a478bee46e88-361a2b35aefmr12367135eec.29.1792449337243;
        Mon, 19 Oct 2026 15:35:37 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm44127084eec.20.2026.10.19.15.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 15:35:36 -0700 (PDT)
Message-ID: <a06f3cc4-b457-41af-b981-0a3da19da87a@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:35:35 -0700
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: qcom: camss: account for C-PHY when
 calculating link frequency
To: George Neacsu <geocausa@gmail.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
 <20261017035221.3816464-3-anusha.nandi@oss.qualcomm.com>
 <20261017101227.61271-1-geocausa@gmail.com>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <20261017101227.61271-1-geocausa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA5MCBTYWx0ZWRfX/CPSGV34zJuy
 PsOaJ/MIntx9faTDBn89YHbzptupuvE2gSZ4IEbE4A/s1HkUG8NYJLp5T0dRinhKW6yFJc7yNlm
 6w0m1qaYd0TELKvGRsiNAX4zBYwOaBA=
X-Proofpoint-ORIG-GUID: bRpnJ8-6iAuQOkbXKhVXXfYybsYohTx2
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad69b3a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=2yIVbSAsc_rmbFz1E4sA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA5MCBTYWx0ZWRfX4+CmQ2i0ChBH
 Z69oravRYw0ZGrpeYKMoX5IUXsBPK05kBGUuuixS0zWaGaFNncPYoedoD00bcFP0k+CB+UF7ie8
 8aG44LEIDLlXbqZLx9Nx57lYMcAZf+5AmVH/gZrxJ/e5bk06rk8P5CbsHeXSUq2FwdMCF5EXj05
 DsPMJkQAG1W37/mNKnybUOcaNtNQD52dhzDvFDNCk8mM+UACCQHe5FXd5QFA0k3z4SKrM05i2Rt
 lUZ4MZUQRZiy1NLK0vGpwfiZH9nNAcNKZes2cotB5VfI9j1tgda3tcR5eoDqDlo44mg5wdnD/J6
 4kOXA2u1c0ttUvimEJYvY+omklCtH+d+9sK2cuwcSeNduiSfvl/L9e0E5z/88DH3dO4chbMU6L1
 0cZoRB9z4eKrCM1E9t5Pox/zarCdRN4/snqbyyZHuEUgPrpsE2s4RfmCkzbGFBhm2mYxwOjOrp7
 /YCxvS03yAzUgi4VUuw==
X-Proofpoint-GUID: bRpnJ8-6iAuQOkbXKhVXXfYybsYohTx2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_06,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190090

Hi George,

Thanks for testing this on X1E80100 and tracking down the csid_ops_680
path, really appreciate the thorough analysis and the control run
confirming both front and rear capture work correctly.

Let's fold the CSID-680 line into this patch. I'll add:

val |= phy->cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;

before the CSID_CSI2_RX_CFG0 write in camss-csid-680.c alongside the
existing gen3 change, so both receiver paths are covered in one go.

I'll send out a revised version shortly. Feel free to add your Tested-by
tag when I post it.

Best Regards,
Anusha


On 10/17/2026 3:12 AM, George Neacsu wrote:
> Hi Anusha,
> 
> I tested the CAMSS pieces on X1E80100 and found one extra receiver path
> that needs the C-PHY select.
> 
> X1E80100 uses csid_ops_680, not the gen3 CSID path changed here. The
> C-PHY flag reaches struct csid_phy_config correctly, but
> camss-csid-680.c leaves CSI2_RX_CFG0.PHY_TYPE_SEL clear, so the front
> IMX681 stream is decoded as D-PHY and capture times out with a zero-byte
> buffer.
> 
> The equivalent change for CSID 680 is just:
> 
>     val |= phy->cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;
> 
> before writing CSID_CSI2_RX_CFG0. With that line, the register reads
> back 0x01300000 on CSID1 and 3844x2640 RAW10 capture succeeds from the
> IMX681 over one C-PHY trio. The rear OV13858 still captures over four
> D-PHY lanes.
> 
> I also ran a control with your posted CAMSS/qcom-mipi-csi2 module code,
> plus only the X1E PHY table and this CSID-680 select: both front and rear
> capture successfully.
> 
> Would you prefer to fold the CSID-680 line into this patch? I have a
> clean follow-up commit ready if you would rather I send it separately.
> 
> Thanks,
> George

