Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485227;
	b=p+cUFs96fhiTS4GmZGWuDMIZRxAV05mgj5YmEvgHttS67+Jd+NEGv2POpCTW01Jg/c6I
	 5uAzT7OfwkGFNG95SwwdY6QYudXbWLIsM01NTr9+FSFN9byLS9ofS2hkVctHHVgC1Q+B9
	 ZZY8Kbl0WnlL84eCJ+6ZlOPYRjJ52m/N4GywkcUmKu1Ebk6vH0kku/iTmACxruapg41Pw
	 G79ZkbUsHhkNr5FkJDU0o+ZJKfWFnMvdnd9eiHCNaEnfgElqlDtw5g+rmmUre99sK+pWN
	 isWsYjh6sNdX2M5V5vqUFP2g3rst7UD/eC3SjXXPmw0FgY9EKYbn42c9AengWss7gVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485227;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=;
	b=bsdBGeor3iq5KctBUboijW5qgVdp0ZxVmx6N/aEyMEuItM4NYJAlLt9SQUXvFgx+ZWY6
	 YwYK4Ue2BltX2+QxrsQjtfXMc834/+W8MpR8uRdcQ8fT8NcYWcXLgIvfxmScd/S0Q8aNc
	 7r9dzxiTCPXXGGIE3uCZA6QaEDzKvxexlmfv3Bk/WdfPb0yjDIIhDdm0LbFsddE8szOSV
	 V4cgSH2MGSQROEEgR4Houhd4/Rr+VhjQ0qQMuEtY7Dbz1EpTOS0QIEdUh65V1nXJT5aIj
	 U/7viZJS96v7tuuTDi3/Zc2e8QnTWQHTnCZwWPoeWjDiT1AeXJgQon6Qk0oIYJB8GfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Vf5/NbzF";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SMIXbAdL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5676B606A319
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5676B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vf5/NbzF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SMIXbAdL
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8UtVI1125670
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=; b=Vf5/NbzFckgIDw9m
	VsqvR3HDMlTjgkw7l0VUPY9u4e5S13jBuNjqRxzdCzhAtqSC9gKLyhfGqx633Yur
	BS9opZcTtSpFIHiw7Dn2mcALKsdmfc4MXGqYNpio+zTi5v3dicw5UvE2Un2SlQtP
	gSgsItsKlqACFEPDFt5m5j898YxsY5jOWqkWYyKD9jMC08AvLiLXbLqAM/dkLXj7
	+vx1twhvhv28KrB/Yzbu1Ly29bB2Dud2PWUDx/qa3J9sUzcoli1yo3KQCt8lRcAg
	1K2AjWLG/mariazX6pOvjA9nh5IqnT3sr0KrveXsU/3vw14MXxEPut5DRciObH6m
	bif9Rg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1nfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:33:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac58b24so96732985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485225; x=1793090025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=;
        b=SMIXbAdLQScYaVkg5e34wX7g4KRK4iDjnBcbbYWc1ZKO4iHM2Qw2v9YQ0mXPcCdEgT
         PpMpyaB79k9RYSxrBN8rYTWqJ4p9W2pgGffRH8ipGp3G6uY3omdeMgx8wQMHN/vhHoJz
         cKrZIGeEckfPZaA+FWvdydLQRNJSpfT/0W+W94hGtQvMWRH5sY2X+MeKw9LhNca44RXI
         aW9ZJ2jLzZnVW2sUceUXu04TkRPMEK3/CyaC3vjNPexNx4sbuotRzPSczlGB1lxtxFNw
         Yu2EPZdSREWSOwZpqBmFhw171sVEncivWQpcbz4/8eIG4AKzQ5JO31RsSt1mOqtuFDkn
         NeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485225; x=1793090025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p66OhLIDCBcG9nHMSWG1cULPATR7vDMq3ytT8TFvDbw=;
        b=QR8rJC56NYF0+Re85epIUzYE2Ewzaz+oNp+M7dsbBC3iMIER/bTMr6kLyEIw+fwYne
         GvUsoxXnyExYE5bbvj7XuZ9NYiTsmDx7qlSFUd79b1Jr0xrotd5Qo1ubLgIxEsmoxU2q
         rX4oylVXXnXrFvYUHFbSgBrWVTQjjrmBIj/sPTiAbC6qksHLOqw1LCQFSsAh5vIeMOKd
         4MnjFDnHw7Uv1ztU/8q67cMOGVufpj6iVwPRiNgJ9alwhpjERXIcism9bANjdzuW2Lxy
         t/lpeSugBrX+szR94YDYlYWB3qLOyxtHgto+DwuetxQCuIjdZLARa1Ow0GXCjF5RVOYP
         f9dw==
X-Gm-Message-State: AFq9FYIjUoj5KFBLljTzKyAdqljlVzjdPeARuthqGwNkdGB5GEzFtZfB
	y+KATnwoZC8KpqGPSGilC/XKpdYLs2D913E/1rra/616E+r67YJkgCv6a4MBJyzIT+lESzTTwsC
	0/Ey8qIHXRhsffBRqQuJR1/NCiayLUvafrxcMVxW50L489FotbJnJitZE+DSUc00WRG8j
X-Gm-Gg: AYBFou087GeUPYMPt3eyrcFixHmCSbufCqVY1wG5FvKwHAMqhDxGkB8Z+QU0m8wsNHr
	0YjRbE2k6S2ciByy951z09jM1GkZeu2Cyb0DMqQpGTQY6RPcbibgjBSPtHvOHX0CPl5a0tPH/q3
	7NTgSw49QOXCAb2dhLF8q5GFYoMsddFSFgYmwIpbijZpN3P2ZggVdWUV/NQ2B+/8YWq6YNNThpw
	jepbPz70V9GaelOKdPRmAB0CdrE909NA6Hti1zgY/ViYPREWC+XPTTeWth27+pZ7xTjUFhGE70A
	LhEwcTtvrc6jROwiTeWntLA/U1EMyIR33NVO+ovsKnhYWd+J9D346SVQetAJ0G3YXt4XQZtGhdm
	v1aDG8W2tp+xYT38cvnxGkw==
X-Received: by 2002:a05:620a:7086:b0:93e:e111:2771 with SMTP id af79cd13be357-93f29beee37mr1876095685a.2.1792485224578;
        Tue, 20 Oct 2026 01:33:44 -0700 (PDT)
X-Received: by 2002:a05:620a:7086:b0:93e:e111:2771 with SMTP id af79cd13be357-93f29beee37mr1876094585a.2.1792485224147;
        Tue, 20 Oct 2026 01:33:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf123sm456787166b.14.2026.10.20.01.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:33:43 -0700 (PDT)
Message-ID: <da0ec4b6-db66-4419-adc2-9600d8cc5793@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:33:39 +0200
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
Subject: Re: [PATCH 04/10] clk: qcom: clk-rcg2: forward the gfx3d rate request
 to the parent
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-4-370949e4d8a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-fix-clocks-v1-4-370949e4d8a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IFB4JIeNX-tx7mCOY1OqzzejGo5V9fUw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX6h+w8y95nVtv
 5Sb7rBMlAUqXeM+kZUD/6RAYQdsActidoI/UFAjLvUHUwHf/48fYIc88Gqev/6ybXDZJDqSH+T3
 Xf8pEvSlXhAX34SOXXiCundUp9kIl0I=
X-Proofpoint-ORIG-GUID: IFB4JIeNX-tx7mCOY1OqzzejGo5V9fUw
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad72769 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=RaLkOdssimeRB-vWfmoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX/D+gWleuI+nq
 w+EN7qQ+i9LlHi06MXxSYbdIkgBnNSnKRgWz2UM4vKKN3OPrx3iQRCfXDFb09j6E77f8QSAbwvr
 EPc6RgwAaZUsoDZvs436mkbxKgl6iT7UttF79yRE0gT0qcPbhQ9YxkQrghBeBF6HThVtx8qV0vN
 9hrGoKFMRCaKJ5HoRxFMPimdAgPNJj6s0PwmUViCE08X6Omn9c46sDFO9uiFq8cLYevaVcS8/KG
 XGFGeX/N8T8S3f68Em1MTDhZ3+i98HRRSxBgDg+8Zi+vnjY60odVhO8Ed3B7t1K+xctV0zwQwhZ
 sfapHpdDnCWhXPP9VCQovoHKLt4oDJ377aOLcT/X9eMnsXB7WfTuO54FBcWVcJn0peKZxZR/RVy
 R3k1Vfno2SLd5/zwK4J4wf9RRUt8CXiYFn31i9tXYFLrS3sD7lAzpDFR3FQt6bKq4SfPQxEpa8y
 Wk/Sz1TGKS13eVJiL2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200033

On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> GPU DVFS on SDM660 never changed the GFX3D rate. clk_gfx3d_determine_rate()
> builds the parent request by hand and leaves best_parent_rate at zero, so
> the PLL is asked to determine a rate for a zero parent rate and the new
> rate is dropped on the floor.
> 
> Use clk_hw_forward_rate_request(), which fills in the parent's limits and
> rate the way the core expects them.
> 
> Fixes: af1e62f2ffe2 ("clk: qcom: clk-rcg2: Take clock boundaries into consideration for gfx3d")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
