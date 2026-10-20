Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498371;
	b=PchGuhslGYqSZfh2E9dpIhgng1GcTSGQ8z+qmhkQHt80gs+oS+SNS9De7AGB0E503LPX
	 TxoK1NlRHP+hvbvhdkh2ti4Q2JmA+BWvWgkwMmhfDXk+R/SzY0UPmzBVLRXWZOOmwEOXZ
	 bS4CRoptNNCCc0fQXuOWB+hlUCAlBsmVN9bjsFjjVCw32JB4/yOavx2gFU3Cl3oXPvWep
	 lCEiwsSD4mD5xfbVr8ECfUJGEPcVO1fJpz4fZr5Ltdilwiqop4A3h+P6QP8btNgktcqW9
	 ZM51G4ZrqOqhs4pwdEmaQjALEqnvmBcrbSgFtfBjhDxAseGr27X9WjI/lB2KbJ+DmDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sUryX+0FjHEbTNaymK2iG7rA0dEGvt/oJcLWzKkS8io=;
	b=BmpNFzzQxERD6WZbh2wP8rYYhKBekx6mzHvXlaTKAyjwECMw6W9Y4T8ja1sxwM8rNXcz
	 Qsy4qLBxki0Hx3MLNazY2MTKaLht9jRTdTlwg2CwP21COVq/Wm28nJAZrA1l7dKw63h/d
	 YS/3OU2S0hT0Ynqap9iCaUH21zWArNOGlmEkpPkvG4MKSbG/dA21LUWEv66rI5dQX9/Iy
	 AB9+/Zd/fUpoFoSVOd++U2nSpWjgae9iTV0kedmdd82RAPavLFR9TjAgmNfRhRzHBdja9
	 Gkho52Neksa/VBIxqpq7J0qBgWSqWGTRVajDV0TikTI4ZgnsFOom9I4dd8wwM3hey6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xohs3uYI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A6XNMzBB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7312606A319
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7312606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xohs3uYI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A6XNMzBB
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxGAB1292835
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sUryX+0FjHEbTNaymK2iG7rA
	0dEGvt/oJcLWzKkS8io=; b=Xohs3uYIL0ww0NyrblbGtm+PpOq40M2vBPAFANL9
	PY6Eqm3X9/7ChEA2n0TzRcCUsVv/C4lVqK07HW41T49goqZG6toiutmJefxqJFSp
	zkHnBrEd4BqI9jDPR2Wv4V0Em2VDxSXsBylfZlslaZmrJgN6XYEIZ7qikUl68z9v
	FeGcqR/dJ6uXs6klBisbV53pdFOJmdA3sHflqCSr/cWj+sTPSYSfnJuIDGDCxuPi
	mZ9HOQFpjnZQCwGBird1670WQshX75ljZmPFmKGEqPJrpx8vP2bIhvHcwIpoAJOa
	UGSKbiQmnxEjJo3J9FAGXRDjEtXruMgy8AaEeZXqrHd3lw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2d0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:12:49 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc4149b885so2827696137.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498369; x=1793103169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sUryX+0FjHEbTNaymK2iG7rA0dEGvt/oJcLWzKkS8io=;
        b=A6XNMzBBO8GYXQ/i/E7oipglgXHT/Gxh7/83J9Y9fREB+qu+AN1ophY5babQYUHZwl
         JiZUQ2NyVi3fBqk9Nli70vfZQzHruv5V8p09iJKY14/O/1e1QzeG6DmR/Cg4FRTU/Gax
         L0qjd7NaYcOrKVYRz2FC/C57x3KOJTdH2/Aa6TY5PnkbuptO9Jqtl6o1FMHrAcPmpWc0
         lbI7dLBJYxvwM9fqquNUnas7UG+H/UV1z6paLg7XLnxQUCnlPKg0EU2WVLxDixovBXrd
         FejQEZwl3sDsoeWBUqvisvnFhYaVr+JN9Ye1fn2sgAcTmz4UbTIeuX9j1lHAjI6E3RPP
         a7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498369; x=1793103169;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUryX+0FjHEbTNaymK2iG7rA0dEGvt/oJcLWzKkS8io=;
        b=G9/3EDs+V/Lw56A8B7bN/cjczf2oX2ubIQNDVl4kXqLbdX5xR/4qRkTECkenzdmLW9
         Xa5B/RnhY0qez0jGIFvHhoXD7MtG7pld3cuHZPjyy+MI5xY4oVnmguys5GXYcmuylOvn
         uOUDGFgwipNAnrTWELOpWR83qs2P8O1QrT4R0FNG3apDfQQ6PQYLFw+DeYrz1KvU2/Td
         wzPR6dwyD6dOS7wzy8nl/gp14NnZavfVbSoS2D3PBzBK2UPGwWwVX/X68Zjl3xGfoXa/
         Pi0MHG01zpjIgfP114r7yla8doSwE1vcZwKePD00XXY1d39+0eIQAaeoNcgJxkhc3y1T
         aqPg==
X-Forwarded-Encrypted: i=1; AKwUvByWBXpjToayKPK744KCewYHC5FERozJAtgE8jUcnKNF+fRQw7ADXwoOyOUV8J/A6SYzz6akVtPcFww2GV0r@vger.kernel.org
X-Gm-Message-State: AFq9FYLGs/ZXKaFXtOuVrGRzh64zv7KyhgAKB3iWgFmpC2tnuKaOPkRD
	lBh8N8gHdQX9qEAX83he/owtQR9RZuq83r4QTxoYgo7EXxTONM1SI994+zGvzPl88ragocLLk6R
	vw3BbAqvoEGfqFOi+tY/HNXX/eG5QTPawmWkYGBnyzvXGO4jptL3pgmS9SaUDHV++jkri
X-Gm-Gg: AYBFou0ljesxZ+mLAPX+zXQo/1/gDMUc4iSPGQ6ZColR/JSrVEkd7SgntrGbmumcvLN
	fil2HRWgswYyJLxEgBbhoRnktHYVRi0qy1qlc4H2wXpISGZ4HOw5z6oFAOMYFZXgSmZ2G+Bm0e5
	aS2141kszm55dclSJKA8Y5JL9bS3Mkt7P0+vqP/mr1NsLauTMJDfgLggYtPv4sTiR4tbjY8gn1x
	ILTFckc/Wbbz6mIYmjDFBSMkh7elAMzuU5EtHz8iRcO+9PoxHpnv1Wo8uI0T5uEJToYCHHXz0ou
	9IduSnOUxCYNta1fweCtoS5hyM2RGKl2/G9z+MK+qaAxx9xiRh3tQiVoPPoXYgam+LaK38F8tJT
	bs7Gz3BLk5A7Q0BKh
X-Received: by 2002:a05:6102:2c8e:b0:7cc:2712:caf2 with SMTP id ada2fe7eead31-7cc36a4cd38mr3055827137.23.1792498368882;
        Tue, 20 Oct 2026 05:12:48 -0700 (PDT)
X-Received: by 2002:a05:6102:2c8e:b0:7cc:2712:caf2 with SMTP id ada2fe7eead31-7cc36a4cd38mr3055811137.23.1792498368097;
        Tue, 20 Oct 2026 05:12:48 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cdf2f0d1sm205783705e9.2.2026.10.20.05.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:12:47 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:12:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: lemans: Add label for firmware
 and reserved-memory
Message-ID: <rhh7s766m77am3yfktpeaikyswehfn5pa3l3hsbd2ugegmq4te@4rea24zv6an2>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-5-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015023711.721837-5-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: WKLCSjqCgxFZgULyTFy_MS5aiiFpSNcB
X-Proofpoint-ORIG-GUID: WKLCSjqCgxFZgULyTFy_MS5aiiFpSNcB
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad75ac1 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=8WBkPR08O5TzQ9HkguUA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX8EdchGIAGZMJ
 32VWn17z2CunSrF2n9uxhrMg+Qu0w40os1l6Xw/Mt2YGor6njYzaPr9PASQ1x2htfyJ65B1SoUE
 LgZZMHSg9/kpv/i0YCBDt5tql6H8+f+fBmDYdIS0ATIzsl6D5t8+rnuAzkHcpcWZhHY5M4tioaS
 ybjPy59h8j3c4OMJxDinMPEoQAOv88MR21rLS6sQWIXO9T11Qdx9RI5RmB5RQPbVCzxz8I5k+HU
 /h5HC3dxvRv79fcKw5uvDoUqPwohAV6YzevdkkWwkQVy9t2OckRysGuFx9H202/CbPBZexEBqR8
 43pbrR78kAzwkVtu5givL//CGDpoKwDlAlcWciE1CSRSfmrDG6yxVV26OPeoM5OKGq8ksW5MrX2
 OcWGNScwIGvHxBh9qIoYWFAUPPXXRpVZHoTd6VYr/0H1fkEkw0Tmm7vMSczwOPhvASeXSSIEoPI
 n3xbC8Jw8X7GG71+1WQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX0EYOOuM+DhdS
 +LWamUX7YgOIOw0NUL3bszYZYV7mW16nfrTLwhpl9UUWdKaM/X9qjAAH8oMqbHMliCxUWznOtRO
 3GEor/xdMCus5Z/v1OHtot3WyqtA+Ww=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200048

On 26-10-15 10:37:08, Shawn Guo wrote:
> Add label for firmware and reserved-memory node to make it easier for user
> to override the default configuration.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

This could've been part of patch 5. In any case:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
